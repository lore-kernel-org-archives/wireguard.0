Return-Path: <SRS0=TH/E=FY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BEBC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 21:11:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C59022273
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 21:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C59022273
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ef4f9f5;
	Sun, 20 Dec 2020 21:01:27 +0000 (UTC)
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com
 [205.220.184.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0810a1a1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Dec 2020 21:01:24 +0000 (UTC)
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
 by mx07-0057a101.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BKL4aj5004138
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 22:10:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=12052020;
 bh=GPpV4bg4RH642jdYLy2Astmi8cOdAXV3zdttJuuEEf8=;
 b=mLOQXodv4ejgF1pM+pmEoEFMWNjTV6qgxXqQlCWxcZu7sxX8EcYf1vU0H7phP0AoGqDL
 ajMqVDm9tDhH7FpdswdwhMtF85M3pqj/NRRPOQmfpphrxSnvMTTdh5Qd8xgs1al5F+mL
 PlwtelmXPf93THuMYe3nvl3Peb/38zx4R+hIqBc2+XsmV6jAVwccEo6KTsxC1EngkqIp
 NHCUQZS1sZrLBMm9nTpQd09lEdJ7/y8cgWQFFfIrqB+hTFJduDo9JEzkGjKyzONjCzdV
 WFea82Iw04mvu+aYu5/vImomhDNwowErpV0zNhNbf/mRVMi/eagxWuc6WRG95initUOZ KQ== 
Received: from mail.beijerelectronics.com ([195.67.87.131])
 by mx07-0057a101.pphosted.com with ESMTP id 35h6rg9a4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 22:10:19 +0100
Received: from wsests-s0004.westermo.com (192.168.10.12) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1847.3; Sun, 20 Dec 2020 22:10:18 +0100
Received: from [10.0.11.179] (172.29.100.2) by wsests-s0004.westermo.com
 (192.168.10.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1847.3; Sun, 20
 Dec 2020 22:10:15 +0100
Subject: Re: Default route on windows
To: <wireguard@lists.zx2c4.com>
References: <CAF-5T9H9wiZZ7qT_r5PYhj0q6cHogdjXQx38PDQ3QXXm3SftJg@mail.gmail.com>
 <CAHmME9p6U_11+caCpxtaQd=b8OhGf51sW+CH1fRDpALNcyM4MQ@mail.gmail.com>
 <CAF-5T9EZ34sRrs=o8KiKUBbbUxLbbyZ0_RfOJLOpHcW4n_DbEw@mail.gmail.com>
From: Matthias May <matthias.may@westermo.com>
Message-ID: <75011a3f-c143-d88e-c5c9-b13fd5999e3e@westermo.com>
Date: Sun, 20 Dec 2020 22:10:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAF-5T9EZ34sRrs=o8KiKUBbbUxLbbyZ0_RfOJLOpHcW4n_DbEw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.29.100.2]
X-ClientProxiedBy: wsevst-s0023.westermo.com (192.168.130.120) To
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

On 20/12/2020 19:18, Ronan Lucio wrote:
> Hi Jason,
> 
> I did it, but in this case, I got no Internet access
> 
> On Sun, Dec 20, 2020 at 1:21 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Add 0.0.0.0/0 to your AllowedIPs.

What is your remote end?
Does it forward your traffic, and NAT it towards the internet?

BR
Matthias
