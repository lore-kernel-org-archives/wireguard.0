Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3D9C2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 09:44:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 462a8c3d;
	Mon, 17 Jun 2024 09:44:11 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bfaa1a5f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 09:44:08 +0000 (UTC)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
 by wilbur.contactoffice.com (Postfix) with ESMTP id 07EA595;
 Mon, 17 Jun 2024 11:44:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718617448; 
 s=20220809-q8oc; d=unstable.cc; i=a@unstable.cc;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=tA9IupNLwJ8QxLnRXhui26xIEfK6PQ2JKxdeTwZz+Nc=;
 b=iH+7Q8ChfeJVUV9WryGseS38/ZCn3baT1qlo+EZ+x2s8C+TNJHkde2ig5++USsG7
 8QqlieLRFwczlEDY9uyarE5CZnfeNfU78HCIxrQqiGpuXMKpQFr221jJsM6yaqhNMM/
 ExyGmI9yiDGVsF+NremxIgAfBySEz/T+st1Jc55bzQRJmR2DmlBQVPMqpN46Csxvt++
 5VXmfF14uQKw/+pjRQ0W2/G4XV6KV5CiGJwETfR3U3coxzrLDWoAecznA6mj7O7O8pE
 zDonfqiInOrQIyoYwMAGWN00F1H1fJt8o4KLdyz/Sa026mAUKL0uoTvPl4hexYYx3so
 YyODxYv90g==
Received: by smtp.mailfence.com with ESMTPSA ;
 Mon, 17 Jun 2024 11:44:05 +0200 (CEST)
Message-ID: <ce8cd757-3df9-4a71-818e-ae2eda6c9690@unstable.cc>
Date: Mon, 17 Jun 2024 11:45:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Mini PCIE HW accelerator for ChaCha20
To: Germano Massullo <germano.massullo@gmail.com>,
 Max Schulze <max.schulze@online.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGa=++TLvS2y=-D8mk0zx_J7CvYWYQqKBWDv_3+qaQ2NSdiJ1w@mail.gmail.com>
 <78a56a8e-59d2-4948-a761-f1f1b3a6b26a@online.de>
 <93a15ab0-1cfc-4b39-97fe-64712eafb278@gmail.com>
 <f0279e84-9425-4bfe-be3c-009217bf24f8@online.de>
 <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
Content-Language: en-US
From: Antonio Quartulli <a@unstable.cc>
In-Reply-To: <cd332c8e-96c7-49e7-9632-066327a009af@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ContactOffice-Account: com:375058688
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

On 17/06/2024 11:21, Germano Massullo wrote:
> Il 16/06/24 21:00, Max Schulze ha scritto:
>> Ok then I think you really max out the cpu. I have not heard of any 
>> acceleration card. Overall I think it's not too bad.
> 
> The problem is that is far under my internet connection capabilities (1 
> Gbit/s upload)
> 
>> Are you running iperf3 with --bidir?
> 
> Such flag halves the throughput, I am getting ~280 Mbit/s compared to 
> the previous value I got by using
> iperf3 -c 10.0.50.1 -P 4 -Z bbr
> (using the Ryzen as client)
>> Keep in mind that iperf3 itself uses some cpu.
>> You could test serving a static file and transfer via http.
> 
> The iperf3 CPU usage is not so high, it wouldn't change much to use the 
> http transfer


Have you tried running the test between a client, behind the omnia 
turris and the wg server?
I am asking because such embedded devices are not necessarily fast in 
generating the traffic that iperf requires, therefore using a different 
client may give you a better estimate.

Regards,

-- 
Antonio Quartulli
