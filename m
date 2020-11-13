Return-Path: <SRS0=pWoz=ET=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2D1C6379D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 15:47:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB6C22259
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2020 15:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=molgaard.org header.i=@molgaard.org header.b="B9Uk4BhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB6C22259
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=molgaard.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c6b3173;
	Fri, 13 Nov 2020 15:42:54 +0000 (UTC)
Received: from mail3.molgaard.org (mail3.molgaard.org [116.203.246.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6c56ff8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 15:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.molgaard.org (Postfix) with ESMTP id 28B513EA17
 for <wireguard@lists.zx2c4.com>; Fri, 13 Nov 2020 16:46:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail3.molgaard.org
Received: from mail3.molgaard.org ([127.0.0.1])
 by localhost (mail3.molgaard.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3nGREto2ZCt for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 16:46:55 +0100 (CET)
Received: from [192.168.1.2] (3e6b00d8.rev.stofanet.dk [62.107.0.216])
 by mail3.molgaard.org (Postfix) with ESMTPSA id D01CE3E814
 for <wireguard@lists.zx2c4.com>; Fri, 13 Nov 2020 16:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=molgaard.org; s=mail;
 t=1605282414; bh=5yb2uHjkRxHLWYEaSwLfzO1eM2vc4WfKlTvc2+yKdoA=;
 h=To:From:Subject:Date:From;
 b=B9Uk4BhLiVtsjpuc/bYd2oVhEeZUl9C7pAAs+A0XAA285+/uvnb9PfprArYva8k85
 tw+G4q3+ROm3nYNmayl9S1yo3lZ+6qAVja2V7/IRYlb5SCAy75ihwZ5L3qthuUDoSr
 WnxAB9e7ZWZZowCumKSVBecspbbYqaDIVQpDcZSpnhcxjNHlQHaLv4BeMy4v9DzcUw
 /hau0FeyQCNTR20qUO99arzSb+zxIr2mvcKA0dlLl4MY19tQi3lOwdHdpZ7yUjrUap
 WV6D5aFtSR4+kWg3T/DjdzGx7Pf8SOwu4IChh5c2gs/btS2FCNKYLNyfx9H9Xus/ay
 msHaVEutXobmA==
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Sune_M=c3=b8lgaard?= <sune@molgaard.org>
Subject: Hooks in clients?
Message-ID: <6bfa482b-42ee-ebc3-f2cb-4f52d9d2e219@molgaard.org>
Date: Fri, 13 Nov 2020 16:46:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hiya,

I am looking towards deploying WireGuard as my primary VPN connection,
and wonder a bit if the various clients (Android, wg-quick, whatever
there is for macOS, iOS and Windows), could be made to include the
possibility of calling external programs upon (re-)connections, in my
case specifically for port knocking, but possibly useful for other
purposes as well?

In the cases of Android and iOS, I am a bit unsure about interaction
with other apps, so maybe, to begin with, just built-in port knocking
capabilities could be considered.

Any thoughts?

-- 
A video dry
trample here madam ere help
martyr doe diva
-- http://doulogos.blogspot.com
