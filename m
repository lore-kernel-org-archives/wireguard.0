Return-Path: <SRS0=oTJ6=DN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A54C41604
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 17:51:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C831E20782
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Oct 2020 17:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C831E20782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edda2f12;
	Tue, 6 Oct 2020 17:18:46 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5e8b2f47
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Oct 2020 17:18:43 +0000 (UTC)
Received: from [192.168.136.206] (ip-178-200-219-233.hsi07.unitymediagroup.de
 [178.200.219.233])
 by s2.spam-free.eu (Postfix) with ESMTPSA id 501EA1C39EA
 for <wireguard@lists.zx2c4.com>; Tue,  6 Oct 2020 19:51:13 +0200 (CEST)
From: Chris <wireguard@spam-free.eu>
Subject: Re: wg-quick up (on linux) fails in case of several default routes
To: wireguard <wireguard@lists.zx2c4.com>
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <ebc8ff04-a073-13a8-2f80-a5cf01ab8416@spam-free.eu>
 <CAHmME9qUWGbuSasA+xxoJO+ycog9+S6TPW9aPF8fFDkgaQDP3g@mail.gmail.com>
 <79a4e995-763c-9724-02b7-81da87c0f88a@spam-free.eu>
 <CAHmME9pYFjNC+g85BNaaYUsVp9h5mxrGtGZwvZ-WRrSxXEHNgA@mail.gmail.com>
 <413570f5-1761-2864-65c8-706a9858d491@spam-free.eu>
 <CAHmME9oXm6sfOW-OWO35-McDzO463iun5Ga4fKq+C2akSF1-Hw@mail.gmail.com>
Message-ID: <9d5e813d-3f69-af38-b341-02ccab476b6b@spam-free.eu>
Date: Tue, 6 Oct 2020 19:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oXm6sfOW-OWO35-McDzO463iun5Ga4fKq+C2akSF1-Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

Your right, it was a stupid config file.
Sorry for any inconveniences.


On 06/10/2020 15:58, Jason A. Donenfeld wrote:
> Sounds like you put something silly into PostUp, then? Check your config file.


