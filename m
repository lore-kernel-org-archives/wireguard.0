Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ABEC10F29
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:26:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D0CF20663
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=wut.de header.i=@wut.de header.b="DVjcy7Wz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D0CF20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wut.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bb73202;
	Tue, 17 Mar 2020 17:18:43 +0000 (UTC)
Received: from mail.wut.de (mail.wut.de [194.77.229.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e9e6b38
 (TLSv1:AES256-SHA:256:NO) for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 12:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.wut.de (Postfix) with ESMTP id 259A44C0003
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 13:43:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wut.de; h=
 content-language:content-transfer-encoding:content-type
 :mime-version:user-agent:date:message-id:subject:from:received:
 received; s=wutundwinzig; t=1584362600; x=1586177000; bh=JAUM2PQ
 w2zKetbo4+H4oXo3/ftsN1MPyt8V6Gdk52Bg=; b=DVjcy7Wz9RCW6GJbn3g1TXQ
 Tv2FO4UM99jYtYyhfeArE9Jy6eWqEsmB8sUd1fRDyIM9T6B/70X+NLPJ0FxDjmCL
 lHd82Jlb/vcNeBY3PXNkmtY/gILCChHXt1yM/m0Hw/h78Z+3zJXwv3pocyTvk3QO
 MVbIPwQR6Co79Z773u59VY/Of3Xkx210rCOuQQtIPZAx43G4/spWo7zlHRVm8mBk
 33EFn9kyXwSLEmM7w7E8cL0vS8gYhzRQEtcUuSukhcmnGQ7/GwrFB/iXeXC4Z7b0
 Ym7X/RwvNKVY/OA/xnsaH17HBZoWGZv3ue8NMDMERf8qVGtQmrMpXNxKiNMHHng=
 =
X-Amavis-Modified: Mail body modified (using disclaimer) - ms3.wtintern.de
Received: from mail.wut.de ([127.0.0.1])
 by localhost (ms3.wtintern.de [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id H16HmFS1wf-C; Mon, 16 Mar 2020 13:43:20 +0100 (CET)
Received: from [10.40.48.3] (WSSI3.wtintern.de [10.40.48.3])
 by mail.wut.de (Postfix) with ESMTPA id 0FCCC4C0002
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 13:43:20 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Simon Lindhorst <s.lindhorst@wut.de>
Subject: Question for wireguard events
Message-ID: <5b5318f7-415b-e07b-5afd-a1e9b3292432@wut.de>
Date: Mon, 16 Mar 2020 13:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 17 Mar 2020 18:18:42 +0100
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

is there a way to get events for wireguard?

I want to show in an gui which clients are connected or not. For that I 
could poll the wireguard netlink socket. The better way in my opinion is 
to wait for events, so no polling is required.


Best regards,

Simon

-- Unsere Aussagen koennen Irrtuemer und Missverstaendnisse enthalten.
Bitte pruefen Sie die Aussagen fuer Ihren Fall, bevor Sie Entscheidungen 
auf Grundlage dieser Aussagen treffen.
Wiesemann & Theis GmbH, Porschestr. 12, D-42279 Wuppertal
Geschaeftsfuehrer: Dipl.-Ing. Ruediger Theis
Registergericht: Amtsgericht Wuppertal, HRB 6377 
Infos zum Datenschutz: http://www.wut.de/datenschutz
Tel. +49-202/2680-0, Fax +49-202/2680-265, http://www.wut.de
