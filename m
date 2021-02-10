Return-Path: <SRS0=gJ+C=HM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24180C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 14:02:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3398460C3F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 14:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3398460C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=blackberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03469424;
	Wed, 10 Feb 2021 14:02:23 +0000 (UTC)
Received: from smtp-pc10.blackberry.com (smtp-pc10.blackberry.com
 [74.82.81.42])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e518c9e5
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Feb 2021 14:02:20 +0000 (UTC)
Received: from pps.filterd (mhs400cnc.rim.net [127.0.0.1])
 by mhs400cnc.rim.net (8.16.0.43/8.16.0.43) with SMTP id 11AE16td102709
 for <wireguard@lists.zx2c4.com>; Wed, 10 Feb 2021 09:02:17 -0500
Received: from mhs300cnc.rim.net (mhs300cnc.rim.net [10.3.24.129])
 by mhs400cnc.rim.net with ESMTP id 36mf69852n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Wed, 10 Feb 2021 09:02:17 -0500
Received: from pps.filterd (mhs300cnc.rim.net [127.0.0.1])
 by mhs300cnc.rim.net (8.16.0.43/8.16.0.43) with SMTP id 11ADuw5L025640
 for <wireguard@lists.zx2c4.com>; Wed, 10 Feb 2021 09:02:15 -0500
Received: from [10.242.11.39] (ci0600000000525.rim.net [10.242.11.39])
 by mhs300cnc.rim.net with ESMTP id 36j9j6rauk-1
 for <wireguard@lists.zx2c4.com>; Wed, 10 Feb 2021 09:02:15 -0500
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Brad Spencer <bspencer@blackberry.com>
Subject: [Wintun] DEPENDENTLOADFLAG for wintun.dll?
Message-ID: <6c752624-1195-ec77-c16a-9fd438cb11ae@blackberry.com>
Date: Wed, 10 Feb 2021 10:02:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_05:2021-02-10,
 2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=279 mlxscore=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100134
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

Would it make sense to link the official wintun.dll with the MSVC 
linker's -DEPENDENTLOADFLAG:0x800 option?

https://docs.microsoft.com/en-us/cpp/build/reference/dependentloadflag

Doing so restricts the search path for immediate dependencies to the 
%windows%\system32\ directory, and I think all of the DLLs Wintun needs 
are there.

-- 
Brad Spencer

