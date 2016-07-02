Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 892acd08
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 15:31:13 +0000 (UTC)
Received: from fifthhorseman.net (c-174-62-194-216.hsd1.ct.comcast.net
 [174.62.194.216])
 by che.mayfirst.org (Postfix) with ESMTPSA id 3EEA1F98B
 for <wireguard@lists.zx2c4.com>; Sat,  2 Jul 2016 11:34:18 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat,  2 Jul 2016 11:34:17 -0400
Message-Id: <1467473657-10023-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH] use runtime check for getrandom syscall
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

wg(8) used a compile-time check for the getrandom syscall.  This means
it's possible to build wg against a kernel that knows about getrandom,
but then move it to another system that doesn't and have it fail to
execute with:

    getrandom: Function not implemented

This changeset makes the check at runtime instead of compile time.

--

Out of curiosity: any reason to not use getrandom(2) explicitly
instead of using the syscall(2) interface?
---
 src/tools/genkey.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/src/tools/genkey.c b/src/tools/genkey.c
index 1602ae1..d260f6b 100644
--- a/src/tools/genkey.c
+++ b/src/tools/genkey.c
@@ -8,18 +8,12 @@
 #include <syscall.h>
 #include <unistd.h>
 #include <string.h>
+#include <fcntl.h>
 
 #include "curve25519.h"
 #include "base64.h"
 
-#ifdef __NR_getrandom
-static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
-{
-	return syscall(__NR_getrandom, out, len, 0);
-}
-#else
-#include <fcntl.h>
-static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
+static inline ssize_t get_urandom_bytes(uint8_t *out, size_t len)
 {
 	ssize_t ret;
 	int fd = open("/dev/urandom", O_RDONLY);
@@ -29,7 +23,19 @@ static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
 	close(fd);
 	return ret;
 }
+
+
+static inline ssize_t get_random_bytes(uint8_t *out, size_t len)
+{
+	long sysret = -1, local_errno = ENOSYS;
+#ifdef __NR_getrandom
+	 sysret = syscall(__NR_getrandom, out, len, 0);
+	 local_errno = errno;
 #endif
+	 if (sysret == -1 && local_errno == ENOSYS)
+		 return get_urandom_bytes(out, len);
+	 return sysret;
+}
 
 int genkey_main(int argc, char *argv[])
 {
-- 
2.8.1
