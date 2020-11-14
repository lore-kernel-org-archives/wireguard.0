Return-Path: <SRS0=wRPw=EU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB48C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 09:55:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF23C2224B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 09:55:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=molgaard.org header.i=@molgaard.org header.b="ddhUGJaZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF23C2224B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=molgaard.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b257b059;
	Sat, 14 Nov 2020 09:51:03 +0000 (UTC)
Received: from mail3.molgaard.org (mail3.molgaard.org [116.203.246.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 049941dc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Nov 2020 09:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.molgaard.org (Postfix) with ESMTP id 7A0F83EA31;
 Sat, 14 Nov 2020 10:55:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail3.molgaard.org
Received: from mail3.molgaard.org ([127.0.0.1])
 by localhost (mail3.molgaard.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLNFTd5tMSW1; Sat, 14 Nov 2020 10:55:07 +0100 (CET)
Received: from [192.168.1.2] (3e6b00d8.rev.stofanet.dk [62.107.0.216])
 by mail3.molgaard.org (Postfix) with ESMTPSA id 6803B3E814;
 Sat, 14 Nov 2020 10:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=molgaard.org; s=mail;
 t=1605347707; bh=27Tauv9dQCUwgo+8iJOsK1EoF5w3kqhiyw1JEkKgSz0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=ddhUGJaZTjlpx0ReMM9w3NtGGnvbloHJJ74g5U5qrh+ZsCx8CfUA4ABw6Xp8XYGVu
 QZhCohbRXRoucL7GRjD91gODt/VEhp7GBfYSjI8gjeIHHG00xlxCwujWrofIQRTrzf
 jy9D13SaiHTW54EWjGHKWcoqkI0KUL6pUnXUqIG61T8qo3twNHDZenDCVb2lJ2hUY8
 iPg3K8nNTO4qWPxFCBld0+8VV3G24Q8GwCnw5gmIuyGmeTbsl2zo0ZuyjN5j+PUcgN
 5IOsM9uULpO60+GapK8F6HR/JMKfz4RLBZbppM33nQ98MExH48xO7YyMHXpz8qzDNu
 5kJVv+ItlIdcg==
Subject: Re: Hooks in clients?
To: Nicholas Capo <nicholas.capo@gmail.com>, wireguard@lists.zx2c4.com
References: <6bfa482b-42ee-ebc3-f2cb-4f52d9d2e219@molgaard.org>
 <a47de6a45010b55c2ddab84e401a81a02f7728bd.camel@gmail.com>
From: =?UTF-8?Q?Sune_M=c3=b8lgaard?= <sune@molgaard.org>
Message-ID: <f33d3e97-5c9e-3573-663f-44ea744e6e8f@molgaard.org>
Date: Sat, 14 Nov 2020 10:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a47de6a45010b55c2ddab84e401a81a02f7728bd.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 13/11/2020 17.58, Nicholas Capo wrote:
> On Fri, 2020-11-13 at 16:46 +0100, Sune Mølgaard wrote:
>> Hiya,
>>
>> I am looking towards deploying WireGuard as my primary VPN
>> connection,
>> and wonder a bit if the various clients (Android, wg-quick, whatever
>> there is for macOS, iOS and Windows), could be made to include the
>> possibility of calling external programs upon (re-)connections, in my
>> case specifically for port knocking, but possibly useful for other
>> purposes as well?
>>
>> In the cases of Android and iOS, I am a bit unsure about interaction
>> with other apps, so maybe, to begin with, just built-in port knocking
>> capabilities could be considered.
>>
>> Any thoughts?
>>
> 
> In my experence there isn't really a case where the client gets
> disconnected (like a crash) and then needs to reconnect.
> For me the client always stays enabled, but if there is a problem at
> the remote end then packets don't go anywhere.
> 
> In other words the traffic might get dropped by the remote (feels like
> no traffic *at all*), but I've never seen a situation where I was
> accedentially sending unencrypted traffic.
> 
> Nicholas
> 
> 
> 

Hi Nicholas,

Well, my worry was that if I used port knocking, then, since I also use
fail2ban on the server, the client (phone specifically), would change
IP-addresses, need to knock, or else get banned.

But if I understand Jason correctly (thank you, Jason), even if we
employ port knocking for a few other things, if we keep the WG port
open, it will actually look closed, unless one actually has a legitimate
client and client config.

Is that understanding correct?

-- 
Real programmers don't comment...
What was hard to write should be hard to read.
