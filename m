Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE8C3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a17ac0b9;
	Tue, 20 May 2025 19:55:17 +0000 (UTC)
Received: from mail-4018.protonmail.ch (mail-4018.protonmail.ch [185.70.40.18])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 67e960c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Mar 2025 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itrooz.fr;
 s=protonmail2; t=1741607292; x=1741866492;
 bh=o2tgjPoaSUwve53mfXDMFPXLM9Q6qVOWUdyBVu8jJ30=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=qWzZtnfmWDTKyX/6wRmUG3Ftu5xjeWc5///bNdXSd0Ixf9L8+hQoNVKRhDhutEXLa
 y/ubT5iOfOuFdK2V1I+a1+aNaTa5myd71mQXhQzRw+YKWp0aFRXw2ZSWcK/RhJCI7O
 zY03oh0Zw2sC0QOFlARgAwy3Rqef7xTtygi1C9Abjs2me5G4gK5X5F9cGmc8JXukA5
 BMQEa0p3/g0/4reW0FfrPBoFU641Xd+tKA/Wtif+Qb+MjugiJEdvpC6lvKQVv1B+Pr
 /E8Jc30VumgRo6zRnb2OsxF16HXHh2Yd+QWeMTIvJ0Jths+9Ycgul27IQpjbs59eMM
 0+YyBETfbKNyA==
Date: Mon, 10 Mar 2025 11:48:06 +0000
To: wireguard@lists.zx2c4.com
From: iTrooz <hey@itrooz.fr>
Cc: iTrooz <hey@itrooz.fr>
Subject: [PATCH] prioritise WG_QUICK_USERSPACE_IMPLEMENTATION over kernel
 implementation when set
Message-ID: <20250310114640.402727-1-hey@itrooz.fr>
Feedback-ID: 63092453:user:proton
X-Pm-Message-ID: 424e9e53d427fa8c427ed5b5c00d07a58549a3f2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

Rationale: today, the wireguard kernel module is embedded in many Linux sys=
tems.
If one wants to try out an userspace implementation, they will first need t=
o blacklist the kernel module, or manually modify wg-quick.
These changes allow users to use a userspace implementation even if the ker=
nel module exists,
by prioritising it when the variable WG_QUICK_USERSPACE_IMPLEMENTATION is e=
xplicitely set by the user

Signed-off-by: iTrooz <hey@itrooz.fr>
---
 src/wg-quick/linux.bash | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..42e2d2d 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -87,11 +87,30 @@ auto_su() {
=20
 add_if() {
 =09local ret
+=09# If the userspace implementation variable is set, use it
+=09if [[ $WG_QUICK_USERSPACE_IMPLEMENTATION ]]; then
+=09=09if ! command -v "${WG_QUICK_USERSPACE_IMPLEMENTATION}" >/dev/null; t=
hen
+=09=09=09echo "[!] WireGuard userspace implementation selected, but invali=
d command: ${WG_QUICK_USERSPACE_IMPLEMENTATION}" >&2
+=09=09=09exit 1
+=09=09fi
+=09=09cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION}" "$INTERFACE"
+=09=09return
+=09fi
+
+=09# Try to use kernel implementation
 =09if ! cmd ip link add "$INTERFACE" type wireguard; then
 =09=09ret=3D$?
-=09=09[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE=
_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
-=09=09echo "[!] Missing WireGuard kernel module. Falling back to slow user=
space implementation." >&2
-=09=09cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" "$INTERFACE=
"
+=09=09if [[ -e /sys/module/wireguard ]]; then
+=09=09=09echo "[!] WireGuard kernel module detected, but failed to create =
interface" >&2
+=09=09=09exit $ret
+=09=09# Potentially fall back to wireguard-go
+=09=09elif command -v wireguard-go >/dev/null; then
+=09=09=09echo "[!] Missing WireGuard kernel module. Falling back to slow w=
ireguard-go userspace implementation." >&2
+=09=09=09cmd wireguard-go "$INTERFACE"
+=09=09else
+=09=09=09echo "[!] Missing WireGuard kernel module or userspace implementa=
tion." >&2
+=09=09=09exit $ret
+=09=09fi
 =09fi
 }
=20
--=20
2.48.1


