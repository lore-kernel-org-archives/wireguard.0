Return-Path: <SRS0=7Dwa=ST=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114F1C10F14
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Apr 2019 02:55:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49BFE2073F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Apr 2019 02:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49BFE2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=activezone.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58cebebe;
	Wed, 17 Apr 2019 02:55:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2321c089
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 02:55:11 +0000 (UTC)
Received: from vintage.nbg1-dc1.freebsdcloud.com
 (vintage.nbg1-dc1.freebsdcloud.com [159.69.229.98])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9caa2e5b
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 02:55:11 +0000 (UTC)
Received: from trinitron.activezone.de (trinitron.vl8-han.freebsdcloud.com
 [159.69.229.114])
 by vintage.nbg1-dc1.freebsdcloud.com (8.15.2/8.15.2) with ESMTPS id
 x3H2t7Ea061712
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <wireguard@lists.zx2c4.com>; Wed, 17 Apr 2019 04:55:10 +0200 (CEST)
 (envelope-from markus@activezone.de)
X-Authentication-Warning: vintage.nbg1-dc1.freebsdcloud.com: Host
 trinitron.vl8-han.freebsdcloud.com [159.69.229.114] claimed to be
 trinitron.activezone.de
Received: from mitteilung.com by MTA1  with ESMTP id x3H2psoD087240
 for <wireguard@lists.zx2c4.com>; Wed, 17 Apr 2019 04:51:55 +0200 (CEST)
X-Authentication-Warning: trinitron.activezone.de: Host localhost [127.0.0.1]
 claimed to be mitteilung.com
MIME-Version: 1.0
Date: Wed, 17 Apr 2019 04:51:54 +0200
From: Markus Grundmann <markus@activezone.de>
To: wireguard@lists.zx2c4.com
Subject: Feature Request for Multihomed Endpoints
Message-ID: <676a8baf337fbc174cd065143da771e3@mitteilung.com>
X-Sender: markus@activezone.de
User-Agent: Roundcube Webmail/1.3.4
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0041868192407128181=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0041868192407128181==
Content-Type: multipart/alternative;
 boundary="=_27d95d91407aea1e62fa10a7bbe858b3"

--=_27d95d91407aea1e62fa10a7bbe858b3
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Hi! 

I have build some complex wireguard setups in the past based on Debian
Linux (OSPF meshed [..]) but currently I miss a configuration option
like 'address' or 'outgoing-address' in my configuration files. The
current wireguard endpoint server is a "small cluster" with two nodes.
Each node has a 802.3ad-channel (IX-uplink) and a etherchannel-bond to
the other node. Both nodes are in the same 19"-Case (2x PCEngines APU4C4
boards). 

I wish the endpoint was able to pick a explicit outgoing IP address to
connect the other endpoint over the 802.3ad interface but the uplink
interface address is not recommend for me. What do you think about it? 

Best regards, 

Markus
--=_27d95d91407aea1e62fa10a7bbe858b3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt'>
<p>Hi!</p>
<p>I have build some complex wireguard setups in the past based on Debian L=
inux (OSPF meshed [..]) but currently I miss a configuration option like 'a=
ddress' or 'outgoing-address' in my configuration files. The current wiregu=
ard endpoint server is a "small cluster" with two nodes. Each node has a 80=
2.3ad-channel (IX-uplink) and a etherchannel-bond to the other node. Both n=
odes are in the same 19"-Case (2x PCEngines APU4C4 boards).</p>
<p>I wish the endpoint was able to pick a explicit outgoing IP address to c=
onnect the other endpoint over the 802.3ad interface but the uplink interfa=
ce address is not recommend for me. What do you think about it?</p>
<p>Best regards,</p>
<p>Markus&nbsp;&nbsp;</p>

</body></html>

--=_27d95d91407aea1e62fa10a7bbe858b3--

--===============0041868192407128181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0041868192407128181==--
