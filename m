Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CF6C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 14:22:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baba410a;
	Tue, 20 May 2025 19:54:15 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da9bff11
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2025 11:36:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736941002; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=n+Ftn8Rgc4hTq4GmJUzI+geuSUQefVyvVGcpAoT4bJj/32CC0I1A834IlecGx+S8f6
 Qj2Cb3E9+VCX5JvVwhQSohOUxlyEbfJHKZwtdG6Z9agli/w+8yfs25uJmxWswBACFTAa
 u7lzHn6i7OrvdxqrUrugKiJd263dsom4/+PL8+7W+D83R7F3r5u8lPIgNTfSfuV1PNuI
 WVRf/rfZAbxyUwvebBrC9KRser4JCaGIsRv0N9IsoU9xs9UG4B9crVlwbN23MAbY4Pyy
 EXjX8GmdxDrL8fQHA0t9caLryY16QjQBaCLvyiYzLE6s7ReosXxA1SXIaNscnSnqVFsp
 kg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1736941002;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=7Dh7bmBt/a/foLXSFExpIZRSMzaBf6MHCVcu9LN7QVw=;
 b=fVC7bEWIsxb9zHNAqNvzJ+XrwjaBOzwc90kYJ6Aj7zJBb05Q7ZFIUQoLm8zB04QRPb
 XXuSD4MNflpFrNPmM96ps/fqS9N0BEcHQN5NmWilLu8KSGHcW0/pAergzEYd7Mou0x1I
 CKW7HDSaPHhwtv9IUo+QN2YfvnSmrRgZfPNGPwcll6kAvm1ZkUTsfpmbK/2d0imlymMu
 6yeHbuV6TD6WK5AwUuo4DmQWucRXagLpRe6mF4Y1SKTB184OFiqT0pzUnm2r+82zx/J8
 UXE1YupLk0ubqy5Qwr8f1gPTozs5O9l/Rr3QyIe4c6lfbB2G0v35A0DRmqwHCf314uqJ
 t5Ww==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1736941002;
 s=strato-dkim-0002; d=kosching.me;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=7Dh7bmBt/a/foLXSFExpIZRSMzaBf6MHCVcu9LN7QVw=;
 b=Qz7VF2ldFEcp2RQGCOmvvvjir83lh9bRdiMaIeiQoVHkOitqnO1aqRYVkk9e6QVJi3
 0hc0hKFCrAWYi07GL0hgKKdBkBKNwVmylFQmRjusFUlFQqBQ6UPZM86DK8kaculhVQk2
 db162ojzdaEzUJdBZmwFvcVsjsw7sfo/tl4lNIBJYE1KoCooJlupUYIVa8C6rU55Z08U
 1XJ8p4PTaRwL1pSVlfNCGiXWchEOQ8OX5DElE/wyEbVLqpmVJmYIO4yGa+oS+OxBwdnp
 UL6fR5CeT2f3ARE/OpsVHHj/u265XcTXobspqR/QeYXCeWS9MUYMJgJSiOmI/n7Hq45x
 cRKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1736941002;
 s=strato-dkim-0003; d=kosching.me;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=7Dh7bmBt/a/foLXSFExpIZRSMzaBf6MHCVcu9LN7QVw=;
 b=/+Y4mtGgeKtwRJXT4pxUehtOqmiLM30inLNryBuwPRGIrgmNUaHfNhx44xhu3evA6D
 h0QHLoQiSsHVx/J2nnDQ==
X-RZG-AUTH: ":PmMGbE6IcPAr6h5auf2ngqbNL/DGPz9JBrgejtg2Gs3S+vZ7Mn0ob7GTnMbSiJYzwnX2ulY="
Received: from eiskaffee.sq.local by smtp.strato.de (RZmta 51.2.17 AUTH)
 with ESMTPSA id f6dd0b10FBaf3dQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Jan 2025 12:36:41 +0100 (CET)
From: Robyn Kosching <robyn@kosching.me>
To: wireguard@lists.zx2c4.com
Cc: Robyn Kosching <robyn@kosching.me>
Subject: [PATCH wireguard-tools] wg-quick: escaped # in Pre/PostUp/Down
 recognised
Date: Wed, 15 Jan 2025 12:33:50 +0100
Message-Id: <20250115113349.106339-1-robyn@kosching.me>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
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

Hi there, 

currently commands in pre/PostUp/Down options in wireguard configs are
stripped of everything starting with the first # - even if the # is
escaped or in a string. 

This patch leaves command interpretation in Pre/PostUp/Down options to 
bash as it can already interpret comments and escaped #. 


Signed-off-by: Robyn Kosching <robyn@kosching.me>
---
 src/wg-quick/linux.bash | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..50bb794 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -51,6 +51,7 @@ parse_options() {
 		stripped="${line%%\#*}"
 		key="${stripped%%=*}"; key="${key##*([[:space:]])}"; key="${key%%*([[:space:]])}"
 		value="${stripped#*=}"; value="${value##*([[:space:]])}"; value="${value%%*([[:space:]])}"
+		commandvalue="${line#*=}"; commandvalue="${commandvalue##*([[:space:]])}"; commandvalue="${commandvalue%%*([[:space:]])}"
 		[[ $key == "["* ]] && interface_section=0
 		[[ $key == "[Interface]" ]] && interface_section=1
 		if [[ $interface_section -eq 1 ]]; then
@@ -61,10 +62,10 @@ parse_options() {
 				[[ $v =~ (^[0-9.]+$)|(^.*:.*$) ]] && DNS+=( $v ) || DNS_SEARCH+=( $v )
 			done; continue ;;
 			Table) TABLE="$value"; continue ;;
-			PreUp) PRE_UP+=( "$value" ); continue ;;
-			PreDown) PRE_DOWN+=( "$value" ); continue ;;
-			PostUp) POST_UP+=( "$value" ); continue ;;
-			PostDown) POST_DOWN+=( "$value" ); continue ;;
+			PreUp) PRE_UP+=( "$commandvalue" ); continue ;;
+			PreDown) PRE_DOWN+=( "$commandvalue" ); continue ;;
+			PostUp) POST_UP+=( "$commandvalue" ); continue ;;
+			PostDown) POST_DOWN+=( "$commandvalue" ); continue ;;
 			SaveConfig) read_bool SAVE_CONFIG "$value"; continue ;;
 			esac
 		fi

base-commit: 13f4ac4cb74b5a833fa7f825ba785b1e5774e84f
-- 
2.34.1

