Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ADBC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Feb 2022 12:30:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d6535a82;
	Fri, 18 Feb 2022 12:30:15 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d004c8cc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Feb 2022 11:55:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3070210EA
 for <wireguard@lists.zx2c4.com>; Fri, 18 Feb 2022 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645185357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q9/9YWNMs1YVVaPMY13amjGyXApU719DKauxL1s7Fzc=;
 b=lP+/2jLQ91vrYTlRMnROhjnGldOMlwD9oPsnwkgRq8V0stgle7f+hw7MVPoj/Qg907FQce
 bzB7mhVc96aDEMtelyjqts2SClWXzpvINvLFHqONqjmmw43g5NeaCzbbode+vyDPpjnp7i
 WYg2it2OpkOBN5aU13ExFuupkMtk7Zw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645185357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q9/9YWNMs1YVVaPMY13amjGyXApU719DKauxL1s7Fzc=;
 b=rGuDFEA80Q772qaafmgO7sphBRO2R8juTwWSri+BvFpGu5JWVm+EzD6sTY0XBbMRxVZsD3
 ICA2+E189y9VFSBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C440313C7C
 for <wireguard@lists.zx2c4.com>; Fri, 18 Feb 2022 11:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CiqBLk2JD2IPOAAAMHmgww
 (envelope-from <dheidler@suse.de>)
 for <wireguard@lists.zx2c4.com>; Fri, 18 Feb 2022 11:55:57 +0000
Message-ID: <d98464e9-d16c-78fa-d3f3-f05ad603890a@suse.de>
Date: Fri, 18 Feb 2022 12:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Language: de-DE
From: Dominik Heidler <dheidler@suse.de>
Subject: [PATCH] wg-quick hatchet: Support systemd-resolved split-dns setup
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 18 Feb 2022 12:30:14 +0000
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


---
 contrib/dns-hatchet/hatchet.bash | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/contrib/dns-hatchet/hatchet.bash b/contrib/dns-hatchet/hatchet.bash
index bc4d090..30eb25b 100644
--- a/contrib/dns-hatchet/hatchet.bash
+++ b/contrib/dns-hatchet/hatchet.bash
@@ -5,7 +5,8 @@ set_dns() {
                { printf 'nameserver %s\n' "${DNS[@]}"
                  [[ ${#DNS_SEARCH[@]} -eq 0 ]] || printf 'search %s\n' "${DNS_SEARCH[*]}"
                } | cmd resolvconf -a "$INTERFACE" -m 0 -x
-       else
+       # Don't ruin a proper split dns setup
+       elif [[ "$(readlink /etc/resolv.conf)" != "/run/systemd/resolve/stub-resolv.conf" ]] ; then
                echo "[#] mount \`${DNS[*]}' /etc/resolv.conf" >&2
                [[ -e /etc/resolv.conf ]] || touch /etc/resolv.conf
                { cat <<-_EOF
@@ -30,6 +31,15 @@ set_dns() {
                _EOF
                )"
        fi
+       # If systemd-resolved is installed, set the dns configuration there (as well).
+       # It might be used additionally (eg for containers) or even for the whole system.
+       # A teardown is not really needed as resolvectl detects the interface disappearing.
+       if resolvectl status >/dev/null 2>&1 ; then
+               cmd resolvectl dns "$INTERFACE" "${DNS[@]}"
+               # Prefix each domain with '~' which will tell resolvectl to use that domain
+               # for dns routing but not as a search domain
+               cmd resolvectl domain "$INTERFACE" "${DNS_SEARCH[*]/#/\~}"
+       fi
        HAVE_SET_DNS=1
 }
 
-- 
2.35.1
