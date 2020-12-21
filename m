Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D898DC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 08:43:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD19B22BF5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 08:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD19B22BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a0617b0;
	Mon, 21 Dec 2020 08:34:51 +0000 (UTC)
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com
 [185.183.31.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 89ba7123
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 08:34:49 +0000 (UTC)
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
 by mx07-0057a101.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BL8hkix031675; Mon, 21 Dec 2020 09:43:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=12052020;
 bh=+o9dSgiE/AJ+RY2MqrI9+GsWYteTzVjnBWE07fNWcks=;
 b=ybuE4G61fVTg5L6yZZl6H9v5UXRqRG5PZpKDEBjmdLUeSOH+XtTpM5PcwVXMNglZNK+K
 ugauvvkm/JhC6SLkTcXCYEEgnEQF73S5xD0J/0z71Co6De9bC3ZwArwyXFklWM7zNeb+
 3wyu97hQEpd6EwzeEGlEpjL62YuFhYHdqiPsBNTvRWv36vWUauM5cMI8Yi05xKqdEr8f
 f2AsSV67zphrulI7QHQ9yJza0+av276v7MRXee0qCo4EcnlgAxa4jo6tFN99oSIKTiyX
 4aMVOkgAaOEac8uBRrktWM5P5apQJLBZvGi4uCc2YQLt0MFiQWrpBfzzwolwpOXlqDnH bg== 
Received: from mail.beijerelectronics.com ([195.67.87.131])
 by mx07-0057a101.pphosted.com with ESMTP id 35h6d8spf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 09:43:45 +0100
Received: from wsests-s0004.westermo.com (192.168.10.12) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1847.3; Mon, 21 Dec 2020 09:42:06 +0100
Received: from [172.29.101.174] (172.29.101.174) by wsests-s0004.westermo.com
 (192.168.10.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1847.3; Mon, 21
 Dec 2020 09:42:06 +0100
Subject: Re: Default route on windows
To: Ronan Lucio <ronanlucio@gmail.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAF-5T9H9wiZZ7qT_r5PYhj0q6cHogdjXQx38PDQ3QXXm3SftJg@mail.gmail.com>
 <CAHmME9p6U_11+caCpxtaQd=b8OhGf51sW+CH1fRDpALNcyM4MQ@mail.gmail.com>
 <CAF-5T9EZ34sRrs=o8KiKUBbbUxLbbyZ0_RfOJLOpHcW4n_DbEw@mail.gmail.com>
 <75011a3f-c143-d88e-c5c9-b13fd5999e3e@westermo.com>
 <CAF-5T9FRtAGnZ9aPReLn83kCJgwmkijSBvutoJkyoxYcLEHhhQ@mail.gmail.com>
From: Matthias May <matthias.may@westermo.com>
Message-ID: <4754a1ea-bc52-f96d-8b1e-2969fb108f85@westermo.com>
Date: Mon, 21 Dec 2020 09:42:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAF-5T9FRtAGnZ9aPReLn83kCJgwmkijSBvutoJkyoxYcLEHhhQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.29.101.174]
X-ClientProxiedBy: wsests-s0004.westermo.com (192.168.10.12) To
 wsests-s0004.westermo.com (192.168.10.12)
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

On 20/12/2020 23:54, Ronan Lucio wrote:
> Hi Matthias,
> 
> I'm not sure I got your point, but I don't think so.
> I'll have to do some additional tests and will got back later with
> more detailed data.
> 
> Thanks,
> Ronan
> 
> On Mon, Dec 21, 2020 at 10:19 AM Matthias May <matthias.may@westermo.com> wrote:
>>
>> On 20/12/2020 19:18, Ronan Lucio wrote:
>>> Hi Jason,
>>>
>>> I did it, but in this case, I got no Internet access
>>>
>>> On Sun, Dec 20, 2020 at 1:21 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>>>
>>>> Add 0.0.0.0/0 to your AllowedIPs.
>>
>> What is your remote end?
>> Does it forward your traffic, and NAT it towards the internet?
>>
>> BR
>> Matthias

Well my point is, that if your remote end doesn't forward your traffic,
you will not have internet access.

BR
Matthias
