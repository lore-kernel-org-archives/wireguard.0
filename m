Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3B0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 10:05:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D92D61279
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 10:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D92D61279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 116b3f2e;
	Thu, 23 Sep 2021 10:05:18 +0000 (UTC)
Received: from sym2.noone.org (sym2.noone.org [2a01:4f8:120:4161::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8683457
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 10:05:14 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4HFW4T5v9Vzvjfm; Thu, 23 Sep 2021 12:05:13 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: wireguard@lists.zx2c4.com
Subject: [PATCH wireguard-go] tun: avoid leaking sock fd in CreateTUN error
 cases
Date: Thu, 23 Sep 2021 12:05:13 +0200
Message-Id: <20210923100513.1452-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

At these points, the socket file descriptor is not yet wrapped in an
*os.File, so it needs to be closed explicitly on error.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 tun/tun_darwin.go |  6 ++++--
 tun/tun_linux.go  | 11 +++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/tun/tun_darwin.go b/tun/tun_darwin.go
index a703c8c34eac..35d3085747cc 100644
--- a/tun/tun_darwin.go
+++ b/tun/tun_darwin.go
@@ -108,7 +108,6 @@ func CreateTUN(name string, mtu int) (Device, error) {
 	}
 
 	fd, err := unix.Socket(unix.AF_SYSTEM, unix.SOCK_DGRAM, 2)
-
 	if err != nil {
 		return nil, err
 	}
@@ -117,6 +116,7 @@ func CreateTUN(name string, mtu int) (Device, error) {
 	copy(ctlInfo.Name[:], []byte(utunControlName))
 	err = unix.IoctlCtlInfo(fd, ctlInfo)
 	if err != nil {
+		unix.Close(fd)
 		return nil, fmt.Errorf("IoctlGetCtlInfo: %w", err)
 	}
 
@@ -127,11 +127,13 @@ func CreateTUN(name string, mtu int) (Device, error) {
 
 	err = unix.Connect(fd, sc)
 	if err != nil {
+		unix.Close(fd)
 		return nil, err
 	}
 
-	err = syscall.SetNonblock(fd, true)
+	err = unix.SetNonblock(fd, true)
 	if err != nil {
+		unix.Close(fd)
 		return nil, err
 	}
 	tun, err := CreateTUNFromFile(os.NewFile(uintptr(fd), ""), mtu)
diff --git a/tun/tun_linux.go b/tun/tun_linux.go
index 466a805671c1..1cc84cba0ee5 100644
--- a/tun/tun_linux.go
+++ b/tun/tun_linux.go
@@ -419,6 +419,7 @@ func CreateTUN(name string, mtu int) (Device, error) {
 	var flags uint16 = unix.IFF_TUN // | unix.IFF_NO_PI (disabled for TUN status hack)
 	nameBytes := []byte(name)
 	if len(nameBytes) >= unix.IFNAMSIZ {
+		unix.Close(nfd)
 		return nil, fmt.Errorf("interface name too long: %w", unix.ENAMETOOLONG)
 	}
 	copy(ifr[:], nameBytes)
@@ -431,17 +432,19 @@ func CreateTUN(name string, mtu int) (Device, error) {
 		uintptr(unsafe.Pointer(&ifr[0])),
 	)
 	if errno != 0 {
+		unix.Close(nfd)
 		return nil, errno
 	}
-	err = unix.SetNonblock(nfd, true)
-
-	// Note that the above -- open,ioctl,nonblock -- must happen prior to handing it to netpoll as below this line.
 
-	fd := os.NewFile(uintptr(nfd), cloneDevicePath)
+	err = unix.SetNonblock(nfd, true)
 	if err != nil {
+		unix.Close(nfd)
 		return nil, err
 	}
 
+	// Note that the above -- open,ioctl,nonblock -- must happen prior to handing it to netpoll as below this line.
+
+	fd := os.NewFile(uintptr(nfd), cloneDevicePath)
 	return CreateTUNFromFile(fd, mtu)
 }
 
-- 
2.33.0

