Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68D2C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 18:01:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ACF9255CA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 18:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=juniorjpdj.pl header.i=@juniorjpdj.pl header.b="zsHpAgmt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ACF9255CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=juniorjpdj.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52e9ecb1;
	Mon, 29 Jun 2020 17:41:17 +0000 (UTC)
Received: from cache1.ct8.pl (cache1.ct8.pl [136.243.156.121])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a36b3b71
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2020 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=juniorjpdj.pl; s=devil; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Huv27CgxUGcDEM4zA9AnYZT8uyv7DqbZ0g+WUwgjLww=; b=zsHpAgmttG6jSjooLPItN8AcR3
 HQxoSUfWs67ynq+xeDco2QblbAvbgXO4F57keCykcVDGlx3IHH9sfGfs9LkBXltn9reKJqNQznSB+
 6I0juSIKzwl8pg215YS7Q7ku0LBcELqUaUoCGhexhGgjDFsjAyO6XCjqiNZHq4yOFHXM=;
Subject: Re: Standardized IPv6 ULA from PublicKey
To: wireguard@lists.zx2c4.com
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
From: JuniorJPDJ <juniorjpdj@juniorjpdj.pl>
Message-ID: <a1475e1d-24e8-2e0a-030a-cdefffb1de8c@juniorjpdj.pl>
Date: Wed, 24 Jun 2020 19:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-System-Sender: juniorjpdj@juniorjpdj.pl
X-System-UID: 1302
X-Mailman-Approved-At: Mon, 29 Jun 2020 19:41:16 +0200
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

IMO link-local should be assigned by core - RFC4291 which is defining 
IPv6 clearly says:
"Its required Link-Local address for each interface."
https://tools.ietf.org/html/rfc4291#section-2.8

On 6/24/20 7:08 PM, Chriztoffer Hansen wrote:
> On Wed, 24 Jun 2020 at 17:37, Florian Klink <flokli@flokli.de> wrote:
>> Deriving an IPv6 link-local address from the pubkey and adding it to the
>> interface should be a no-brainer and sane default, and already fix Babel
>> Routing (and most other issues) for "point-to-point tunnels"
>> (only one peer, both sides set AllowedIPs=::/0).
> An idea to implement as an option for e.g. wg-quick, rather than the
> base code-base itself?
>
