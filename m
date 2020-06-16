Return-Path: <SRS0=kaTt=75=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC04DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jun 2020 19:46:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A754208C3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jun 2020 19:46:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=anatoli.ws header.i=@anatoli.ws header.b="NT2aGMlq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A754208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c78b2f0b;
	Tue, 16 Jun 2020 19:28:39 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3f842f9c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jun 2020 19:28:37 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id C22F01E00BCA
 for <wireguard@lists.zx2c4.com>; Tue, 16 Jun 2020 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=vnptcm0lqn; t=1592336795;
 bh=nPdrjbQ8GReXhbdJ8i8zbNz50NzAD7TwKdT0taj5TRk=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=NT2aGMlqhNbKzz1M8JmZvDPI+bFFO+aOKpu8+eMGudTr8HPe/NKHFCv3yRW1b2wjB
 2aIWgVWWATDVBaGXhb3XgRIlhnsf3E4gr8n1ieWInx6WRW3svhh/MTNUbl0cbSGVHh
 2/iLj9NsT4BlKdfr/2NNGyouek5vLn3KuQGnw5g7RTHy/biodLWqIggbNx/l/h2UDE
 NrVOtAKZVSiht3YJwLXknCQTOEp6CNDVYOMa6/eQblJul3rksZANqGSZZNT/RYLxXo
 GRNBWKfORke2jTrlPYs7ZTV1R81C7q1AWjGkcngK4qcBg6O8jl7PTdWSELT9RXR89C
 QBk1Y1oZ/ZFQQ==
Subject: Re: Search Domain/DNS Suffix
To: wireguard@lists.zx2c4.com
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
 <CAPqQDTAgsbLq3rdnXJHooxbMtWY5JADfTPUO_jo6MdxvTuGqrQ@mail.gmail.com>
 <CAHmME9qDF+-4Ct08oua4yGF8y1-__Was8ik7F56vmYmiE7YhVQ@mail.gmail.com>
From: Anatoli <me@anatoli.ws>
Message-ID: <aaddabc6-33bc-9947-134b-16d9ba542673@anatoli.ws>
Date: Tue, 16 Jun 2020 16:46:33 -0300
Mime-Version: 1.0
In-Reply-To: <CAHmME9qDF+-4Ct08oua4yGF8y1-__Was8ik7F56vmYmiE7YhVQ@mail.gmail.com>
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

Hi All,

> This is why I wrote in the release notes, "This new feature will be
> rolling out across our various GUI clients in the next week or so."

Does that also include the iOS client? More than a month has passed and
I know AppStore sometimes introduces a significant delay, so just wanted
to confirm if this is the case or the iOS client won't get this feature
soon?

Regards,
Anatoli


On 11/5/20 18:23, Jason A. Donenfeld wrote:
> On Mon, May 11, 2020 at 3:55 AM Shawn Hoffman <godisgovernment@gmail.com> wrote:
>>
>> On windows, currently the following has to be done manually / outside
>> of wg flow:
>>
>> PS> Set-DnsClient -InterfaceAlias name -ConnectionSpecificSuffix "name.com"
>>
>> It works fine (although the lack of PostUp, etc is annoying) , but
>> would be nicer if it could be easily configured the same way.
> 
> This is why I wrote in the release notes, "This new feature will be
> rolling out across our various GUI clients in the next week or so."
> 
