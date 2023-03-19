Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0E8C6FD1F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Mar 2023 16:45:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 737608e9;
	Sun, 19 Mar 2023 16:45:07 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0c2f6b7d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Mar 2023 16:45:05 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v1so2234003wrv.1
 for <wireguard@lists.zx2c4.com>; Sun, 19 Mar 2023 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679244304;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgyNiwdaretRp+J/2Wl0Xlve2a0IvWJhl+PDMNYPjxE=;
 b=h5ZFr6KfC1sfZ95OL1FB4nl7JyNZt93Y0uJuN1TRHg/tBHwJulaznEXY2xcek0mhFE
 fOkwQnTb0cMwDUACa1TQXoecLORAgrJReCdSPe72vZfKL6qY+GK1uxDmE4EhUL1McWND
 MFFsfok9YymYbNXoV2yBd18X+NtBVeDDQy+mewzaRU+V5a8F6NzlGUDucRJebMH6Db4t
 xpy56fPAeLHbGZENF+5PvqbKmDYrLEMsLll4bfhmIcAxmM5ZjJr8JHInyJTYVoenQMD6
 KFPEE0Tozg/0kCp0p2cJvNhnZlGsIgFtPKvoD8chBjJSPo8DCBNnmnmqm6Fz/K32XeAi
 i3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679244304;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sgyNiwdaretRp+J/2Wl0Xlve2a0IvWJhl+PDMNYPjxE=;
 b=sW7xlJEKaAhJO1W9sX33qefYXENh1NVyBiIVfzb8rjErVuwr/+2eFSlQrFTPDZXaSv
 GgAq/F3d1kiIV/BnSSsb1FiuI9iDNhzN11h895jGd5asDbkCsQxWtpDoE2l85DEHPDbV
 VtUjdtppYlnuI/mW0kEQWiky+ClnOBRf607WHasXTM/rdOCbLpbub2GTD08yMA0Cz/Cy
 VtmYa1z0B6kKz5tlmzthg8EVartApglT4PVdiu7B3QRtEFEPMaPQoZON4n+PKngN/ee/
 hcDnR6fL1cF+BCxPgCsIQio+TG890ImnVo8ChO9YTu/n/P1aNQn6iUcCYMltzhSOBf2t
 QXYA==
X-Gm-Message-State: AO0yUKVELGV8BJOmLr90VX0LizKseIKQdQCIJFFht1OR8ucghqTPl2Z0
 3MupbmCc2614+C3SL8zi144SAsFXii0=
X-Google-Smtp-Source: AK7set+WcJiznnN8UOh6iI+IDAiM7Fz9lxEF1AMhM7rBIMSUoAQW03/gzjgqCg+5MfyZv7mDI8bHag==
X-Received: by 2002:a5d:65c4:0:b0:2cf:f30f:cdb3 with SMTP id
 e4-20020a5d65c4000000b002cff30fcdb3mr12049037wrw.32.1679244304398; 
 Sun, 19 Mar 2023 09:45:04 -0700 (PDT)
Received: from localhost ([45.9.46.147]) by smtp.gmail.com with ESMTPSA id
 z15-20020a5d44cf000000b002ce9f0e4a8fsm6921447wrr.84.2023.03.19.09.45.03
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 09:45:03 -0700 (PDT)
Message-ID: <316d48cc-6abc-ede1-5344-26fb81d19439@gmail.com>
Date: Sun, 19 Mar 2023 19:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Dmitry Selivanov <dseliv@gmail.com>
Subject: [PATCH] wg-quick: add possibility to force use userspace
 implementation
Content-Language: ru, en-US
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

This patch allows to use userspace implementation with 
"WG_QUICK_USERSPACE_IMPLEMENTATION" env variable even if kernel
driver is installed. Quotes around program name are removed 
to run like this:
WG_QUICK_USERSPACE_IMPLEMENTATION="setfib 1 wireguard-go" wg-quick up wg0
on FreeBSD or with "ip netns exec" on Linux. This can move
wireguard traffic to non-default routing table or namespace.

Signed-off-by: Dmitry Selivanov <dseliv@gmail.com>
---
 src/wg-quick/freebsd.bash | 6 +++++-
 src/wg-quick/linux.bash   | 8 ++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index b529ab2..663af48 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -116,6 +116,10 @@ auto_su() {
 
 add_if() {
 	local ret rc
+	if [[ -n $WG_QUICK_USERSPACE_IMPLEMENTATION ]]; then
+		cmd $WG_QUICK_USERSPACE_IMPLEMENTATION "$INTERFACE"
+		return
+	fi
 	if ret="$(cmd ifconfig wg create name "$INTERFACE" 2>&1 >/dev/null)"; then
 		return 0
 	fi
@@ -125,7 +129,7 @@ add_if() {
 		return $rc
 	fi
 	echo "[!] Missing WireGuard kernel support ($ret). Falling back to slow userspace implementation." >&3
-	cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" "$INTERFACE"
+	cmd wireguard-go "$INTERFACE"
 }
 
 del_routes() {
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 69e5bef..a883df9 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -87,11 +87,15 @@ auto_su() {
 
 add_if() {
 	local ret
+	if [[ -n $WG_QUICK_USERSPACE_IMPLEMENTATION ]]; then
+		cmd $WG_QUICK_USERSPACE_IMPLEMENTATION "$INTERFACE"
+		return
+	fi
 	if ! cmd ip link add "$INTERFACE" type wireguard; then
 		ret=$?
-		[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
+		[[ -e /sys/module/wireguard ]] || ! command -v "wireguard-go" >/dev/null && exit $ret
 		echo "[!] Missing WireGuard kernel module. Falling back to slow userspace implementation." >&2
-		cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" "$INTERFACE"
+		cmd wireguard-go "$INTERFACE"
 	fi
 }
 
-- 
2.30.2

