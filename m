Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_RANDY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4992C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 03:34:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12417206E2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 03:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Wbm2FNg4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12417206E2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7207e852;
	Mon, 13 Jul 2020 03:12:49 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 658c15b9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 03:12:47 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d98bd29e
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 03:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=NX+lTk8uIOhayhwyH
 HfvgbzCZLI=; b=Wbm2FNg4lxqrPJ4xYE3bo9w5PBdCm10z2stpXprhzpXJP7Hc+
 JkJe9SR1wxv+rP63B31E/uxMC+UoxDCvLeutK66tpey6MRUss0GehulIT4ff86hG
 4loR8hV6Z13lUQSxK0vbwLrxy6+UGktdjLKk4+vhSuErDAQQAXDF3vaDsUoiy7WP
 5nqq7RG/9tfrtyzSxgp7y7JSunmZEpLEKGthuAB7hBF5icnEFRS12djd8qoqZqSm
 m2NaP3oa4HlGLVU736g/5P6mbxcVBpSYz8l3frD49HFQvcS5E1Ci5KQuflJw96Pf
 pxGLM2PTD1JyugjKLaoBSljlA7wEfEZ4HoYoA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 41c04e91
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 03:12:47 +0000 (UTC)
Date: Sun, 12 Jul 2020 21:34:12 -0600
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] wireguard-linux-compat v1.0.20200712 released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-ID: <913e8149b5a5c3a6@mail.zx2c4.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new version, v1.0.20200712, of the backported WireGuard kernel module for
3.10 <= Linux <= 5.5.y has been tagged in the git repository.

== Changes ==

  This release brings parity with the commits Linus released a few hours
  ago into 5.8-rc5.
  
  * receive: account for napi_gro_receive never returning GRO_DROP
  
  The napi_gro_receive function no longer returns GRO_DROP ever, making
  handling GRO_DROP dead code. This commit removes that dead code.
  Further, it's not even clear that device drivers have any business in
  taking action after passing off received packets; that's arguably out of
  their hands.
  
  * compat: rhel 8.3 backported skb_reset_redirect
  
  This works with the latest RHEL 8.3 beta, which isn't yet released,
  and breaks CentOS 8 Stream as a result, but Red Hat is so slow to release
  their kernels to testing that we've got a real issue: we can't support
  Red Hat development efforts internally at the same time as supporting
  CentOS 8 Stream, making the stream project something of bust,
  unfortuantely.
  
  * compat: SUSE 15.1 is the final SUSE we need to support
  
  >=15.2 is in SUSE's kernel now. We'll be dropping 15.1 support in a
  few weeks after people have had time to upgrade.
  
  * device: implement header_ops->parse_protocol for AF_PACKET
  
  WireGuard uses skb->protocol to determine packet type, and bails out if
  it's not set or set to something it's not expecting. For AF_PACKET
  injection, we need to support its call chain of:
  
      packet_sendmsg -> packet_snd -> packet_parse_headers ->
        dev_parse_header_protocol -> parse_protocol
  
  Without a valid parse_protocol, this returns zero, and wireguard then
  rejects the skb. So, this wires up the ip_tunnel handler for layer 3
  packets for that case.
  
  * queueing: make use of ip_tunnel_parse_protocol
  
  Now that wg_examine_packet_protocol has been added for general
  consumption as ip_tunnel_parse_protocol, it's possible to remove
  wg_examine_packet_protocol and simply use the new
  ip_tunnel_parse_protocol function directly.
  
  * compat: backport ip_tunnel_parse_protocol and ip_tunnel_header_ops
  
  These are required for moving wg_examine_packet_protocol out of
  wireguard and into upstream.

This release contains commits from: Jason A. Donenfeld.

As always, the source is available at https://git.zx2c4.com/wireguard-linux-compat/
and information about the project is available at https://www.wireguard.com/ .

This version is available in compressed tarball form here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200712.tar.xz
  SHA2-256: e15b3d4eb2cf186920a6ed13685187d6b846e59eb383c291913628682965ac95

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/wireguard-linux-compat/snapshot/wireguard-linux-compat-1.0.20200712.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
  Remember to unxz the tarball before verifying the signature.

If you're a package maintainer, please bump your package version. If you're a
user, the WireGuard team welcomes any and all feedback on this latest version.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl8L1i8QHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrnFzD/43H09uMYK2PXPChfizkbiz84SvpWpPMqDn
3frC+9Ijp9icZB3Ksd9qauaQhREle6McSjpFPXVL7n6YlLhYPjE5RodGG/sW60QW
OOsCCWrKu1ict8WDDs0X7dIAtj/kKNwu7dUlJnWJRj3Mwe3Wk7s2/uBurf2X6rvC
IzTGvcDDZ/TNDujhJZFgVRmgMQPXGlH0RIp4LVxJSsAIKO1RhjVGGbaTe2deh8sY
YGcdBbtqOCb3K7X/fH2Lt4Ob2FbaqD+DRNDXdV7hPRo/QYtEMBsiiJsw+R9AqtEv
MCg2EBF7l5T4pTiShZKVJnGYQp69vG94QZBrlMNoVJldtqs9DrwehzXaLG4XWILN
Nn0ja2ZIjni+LpVJy7upYwZ9Fzdv6Q85HMVYJpcErhbbEC6uzln6WjXNGKNy7/oA
l9vLu3uFzAvvXBInZDbpg/YpTvd4cXZ1pFFAAGjwCW9B7C4NIu6na8NT9Q51q9EH
0q7l0Hj/CkL0frC0O1xDd5fYrI6SiZRdlHNVWdBCb7siUSw4yjA1L0x5VGkdKCHX
seZLwUin+gaHUQIvTwzbDuHE77K406P4Xp1x1UBFv6g63uZBY3XKukdZSMBOPrDH
eaEbos+pyyV1R49J+SbMMUHkGhIk70OAoFmq+aHdDqITrmhVH/VjSCM04/IdACqo
V4AllFQlQQ==
=rjkE
-----END PGP SIGNATURE-----
