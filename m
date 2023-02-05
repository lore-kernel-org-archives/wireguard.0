Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD24C6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:45:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67ee142b;
	Tue, 7 Feb 2023 04:29:53 +0000 (UTC)
Received: from mx4.ernw.net (mx4.ernw.net [185.144.92.199])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c6d8ff72
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Feb 2023 19:19:21 +0000 (UTC)
Received: from mail1.ernw.net (mail1.ernw.net [172.31.1.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail1.ernw.net", Issuer "ernw ca1" (verified OK))
 by mx4.ernw.net (Postfix) with ESMTPS id C6DCB34D6
 for <wireguard@lists.zx2c4.com>; Sun,  5 Feb 2023 20:19:21 +0100 (CET)
Received: from [IPV6:fd00:2001:0:cf20::1017] (unknown
 [IPv6:fd00:2001:0:cf20::1017])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "Florian Bausch",
 Issuer "SwissSign Personal Gold CA 2014 - G22" (verified OK))
 by mail1.ernw.net (Postfix) with ESMTPSA id 8FDBC23F850
 for <wireguard@lists.zx2c4.com>; Sun,  5 Feb 2023 20:19:21 +0100 (CET)
Message-ID: <90cadce0-51e9-d9f3-4b27-084f49e99f1c@ernw.de>
Date: Sun, 5 Feb 2023 20:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg-tools: Fix too strict file permissions on resolv.conf
Content-Language: en-US
From: Florian Bausch <fbausch@ernw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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

Hi,

I hardened my system by setting a strict umask of 077 in 
/etc/login.defs. However, this breaks DNS as soon as wg-quick is used to 
bring up a WireGuard tunnel. This is, because the strict umask value 
will be applied to /etc/resolv.conf (at least if the DNS hatchet is 
used) and therefore, unprivileged processes are not able to read 
/etc/resolv.conf.

While the behavior can be worked around by setting umask in other 
places, the fix below would prevent this behavior to occur. The umask 
022 is applied before creating the new /etc/resolv.conf in the DNS hatchet.

Kind regards

---
  contrib/dns-hatchet/hatchet.bash | 1 +
  1 file changed, 1 insertion(+)

diff --git a/contrib/dns-hatchet/hatchet.bash 
b/contrib/dns-hatchet/hatchet.bash
index bc4d090..807a14a 100644
--- a/contrib/dns-hatchet/hatchet.bash
+++ b/contrib/dns-hatchet/hatchet.bash
@@ -20,6 +20,7 @@ set_dns() {
  		[[ ${#DNS_SEARCH[@]} -eq 0 ]] || printf 'search %s\n' "${DNS_SEARCH[*]}"
  		} | unshare -m --propagation shared bash -c "$(cat <<-_EOF
  			set -e
+			umask 022
  			context="\$(stat -c %C /etc/resolv.conf 2>/dev/null)" || unset context
  			mount --make-private /dev/shm
  			mount -t tmpfs none /dev/shm
-- 
2.39.1

