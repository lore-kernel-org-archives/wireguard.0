Return-Path: <SRS0=gJ+C=HM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB44C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 17:53:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE1164ED4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 17:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE1164ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=blackberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7394967e;
	Wed, 10 Feb 2021 17:53:02 +0000 (UTC)
Received: from smtp-pg10.blackberry.com (smtp-pg10.blackberry.com
 [68.171.242.226])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d31d2f0e
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Feb 2021 17:53:01 +0000 (UTC)
Received: from pps.filterd (mhs400ykf.rim.net [127.0.0.1])
 by mhs400ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 11AHpw0s139303;
 Wed, 10 Feb 2021 12:52:59 -0500
Received: from mhs300ykf.rim.net (mhs300ykf.rim.net [10.2.24.129])
 by mhs400ykf.rim.net with ESMTP id 36hr6as80w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 12:52:59 -0500
Received: from pps.filterd (mhs300ykf.rim.net [127.0.0.1])
 by mhs300ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 11AHpOE9017748;
 Wed, 10 Feb 2021 12:52:58 -0500
Received: from [10.242.11.39] (ci0600000000525.rim.net [10.242.11.39])
 by mhs300ykf.rim.net with ESMTP id 36hryj9sbs-1;
 Wed, 10 Feb 2021 12:52:58 -0500
Subject: Re: [Wintun] DEPENDENTLOADFLAG for wintun.dll?
To: Stefan Kanthak <stefan.kanthak@nexgo.de>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <6c752624-1195-ec77-c16a-9fd438cb11ae@blackberry.com>
 <CAHmME9o97YiTK6rjOmfE3G5BPaBzM_bdfiOBEGoBHbrDRzf9uA@mail.gmail.com>
 <25F2CB0BAE7B48F7B5250BA5BBF68749@H270>
From: Brad Spencer <bspencer@blackberry.com>
Message-ID: <61250c12-c74c-e94b-bbe7-cf9aaccd031f@blackberry.com>
Date: Wed, 10 Feb 2021 13:52:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <25F2CB0BAE7B48F7B5250BA5BBF68749@H270>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_06:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=941
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100163
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

On 2021-02-10 10:57 a.m., Stefan Kanthak wrote:
> This flag is supported only on current versions of Windows 10.
> Since Wireguard still supports Windows 7 and 8 you but need the "classic"
> mitigation there, i.e. delay-loading and your own delay-loading routine, as
> Jason writes below.

Thanks.  I have actually read your pages previously, Stefan, but I 
neglected to dig in to how wintun.dll loads its dependencies already.  
Thanks to you both for the comprehensive replies.

-- 

Brad Spencer

