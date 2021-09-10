Return-Path: <SRS0=byHU=OA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07584C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Sep 2021 17:19:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A53611C7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Sep 2021 17:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00A53611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=blackberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70613a4e;
	Fri, 10 Sep 2021 17:19:11 +0000 (UTC)
Received: from smtp-pc10.blackberry.com (smtp-pc10.blackberry.com
 [74.82.81.42])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 971bab9a
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Sep 2021 17:19:06 +0000 (UTC)
Received: from pps.filterd (mhs400cnc.rim.net [127.0.0.1])
 by mhs400cnc.rim.net (8.16.0.43/8.16.0.43) with SMTP id 18AHCd4F146319;
 Fri, 10 Sep 2021 13:19:05 -0400
Received: from mhs300ykf.rim.net (mhs300ykf.rim.net [10.12.100.129])
 by mhs400cnc.rim.net with ESMTP id 3aytg6sr84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 13:19:04 -0400
Received: from pps.filterd (mhs300ykf.rim.net [127.0.0.1])
 by mhs300ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 18AHDOCV020543;
 Fri, 10 Sep 2021 13:19:04 -0400
Received: from [10.10.10.217] ([10.4.224.180])
 by mhs300ykf.rim.net with ESMTP id 3aytgg1mn8-1;
 Fri, 10 Sep 2021 13:19:04 -0400
From: Brad Spencer <bspencer@blackberry.com>
Subject: Re: Wintun NeighborDiscoverySupported
To: Alan Graham <alan@meshify.app>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <00042bf6-4e8c-8638-380d-6774b37f96c2@blackberry.com>
 <CAHmME9qXieNWU_Y5rz1eDM9Bh=YjBPaeQFTrsXr4PKHyh1ePRA@mail.gmail.com>
 <310f3386-a488-9e28-2f10-3f867ece0f53@blackberry.com>
 <CAMeHLtxw939uNJcN=UZAR9wM10pB2xYOu2K_X++Z8LsfPCAmNw@mail.gmail.com>
Message-ID: <c84c5f5f-6c47-e109-7592-cd7353761657@blackberry.com>
Date: Fri, 10 Sep 2021 14:19:03 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMeHLtxw939uNJcN=UZAR9wM10pB2xYOu2K_X++Z8LsfPCAmNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA
X-Proofpoint-ORIG-GUID: xGvIKZOGLtX1g9NvadCBUBJxPMZ0TpDa
X-Proofpoint-GUID: xGvIKZOGLtX1g9NvadCBUBJxPMZ0TpDa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-10_07:2021-09-09,
 2021-09-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=629 adultscore=0
 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100101
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

On 2021-09-09 5:23 p.m., Alan Graham wrote:
> Adding the 0.0.0.0/0 (or ":::") to the config is what is causing some
> growth of the arp table, but it is not growing indefinitely.  After
> looking around for SupportsNeighborDiscovery and finding nothing, I
> decided to check the repro.  When not routing all traffic through an
> interface the arp cache is basically static:

Thanks for looking into this, too.

I also suspect having the gateway set like this is probably necessary 
for Windows to start adding ARP entries.  How were you able to determine 
that it is also sufficient?  My guess is that if it is possible to 
indicate to Windows that the interface does not support neighbour 
discovery in general, doing so likely prevents ARP entries regardless of 
the gateway values.

BTW, how did you determine that it does not grow indefinitely?

> So I tend to agree with Jason that this is "harmless" and shouldn't
> cause any serious problems.  It would be nice for Microsoft to fix
> Set-NetIPInterface, it looks like a bug that SupportsNeighborDiscovery
> can't be set.

One "harm" might be that the OS keeping an easy-to-query list of all 
(recent?) destinations in the ARP table, which could be undesirable.

I'm not sure it's a bug, per se.  It seems by design that you cannot 
change the value of SupportsNeighborDiscovery after the interface is 
created.  The documentation for SetIpInterfaceEntry()[1] says:

> The MaxReassemblySize, MinRouterAdvertisementInterval, 
> MaxRouterAdvertisementInterval , Connected, SupportsWakeUpPatterns, 
> SupportsNeighborDiscovery, SupportsRouterDiscovery, ReachableTime, 
> TransmitOffload, and ReceiveOffload members of the MIB_IPINTERFACE_ROW 
> structure pointed to by the Row are ignored when the 
> SetIpInterfaceEntry function is called. These members are set by the 
> network stack and cannot be changed using the SetIpInterfaceEntry 
> function.

I noticed that the Cmdlet in PowerShell seems to treat the 
-NeighborDiscoverySupported option as an input filter vs. a value that 
you can set.  While this surprised me, it is at least consistent with 
the Win32 API docs.

1. 
https://docs.microsoft.com/en-us/windows/win32/api/netioapi/nf-netioapi-setipinterfaceentry#remarks 


-- 
Brad Spencer

