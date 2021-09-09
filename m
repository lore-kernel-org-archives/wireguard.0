Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF39C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 18:15:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5B39610C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 18:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5B39610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=blackberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc33038f;
	Thu, 9 Sep 2021 18:15:10 +0000 (UTC)
Received: from smtp-pg11.blackberry.com (smtp-pg11.blackberry.com
 [68.171.242.227])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3104ec52
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 18:15:05 +0000 (UTC)
Received: from pps.filterd (mhs401ykf.rim.net [127.0.0.1])
 by mhs401ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 189ID27P071919;
 Thu, 9 Sep 2021 14:15:03 -0400
Received: from mhs300ykf.rim.net (mhs300ykf.rim.net [10.12.100.129])
 by mhs401ykf.rim.net with ESMTP id 3ayksdrauq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 14:15:03 -0400
Received: from pps.filterd (mhs300ykf.rim.net [127.0.0.1])
 by mhs300ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 189IDQWV007748;
 Thu, 9 Sep 2021 14:15:03 -0400
Received: from [10.10.10.217] ([10.4.224.180])
 by mhs300ykf.rim.net with ESMTP id 3axcn6vsp0-1;
 Thu, 09 Sep 2021 14:15:03 -0400
Subject: Re: Wintun NeighborDiscoverySupported
References: <00042bf6-4e8c-8638-380d-6774b37f96c2@blackberry.com>
 <CAHmME9qXieNWU_Y5rz1eDM9Bh=YjBPaeQFTrsXr4PKHyh1ePRA@mail.gmail.com>
From: Brad Spencer <bspencer@blackberry.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <310f3386-a488-9e28-2f10-3f867ece0f53@blackberry.com>
Date: Thu, 9 Sep 2021 15:15:02 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qXieNWU_Y5rz1eDM9Bh=YjBPaeQFTrsXr4PKHyh1ePRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA
X-Proofpoint-ORIG-GUID: Mnc67uufPDOzfSno-LF8qZAP2L3TsQtY
X-Proofpoint-GUID: Mnc67uufPDOzfSno-LF8qZAP2L3TsQtY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-09_06:2021-09-09,
 2021-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090111
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

On 2021-09-09 2:42 p.m., Jason A. Donenfeld wrote:
> So how exactly were
> you "seeing" the ARP requests on the Wintun interface? Did wireshark
> show it? Or did you read from the Wintun ring and actually see an ARP
> frame? Or something else? Or was this just a manner of speaking and
> you didn't actually observe ARP frames themselves?
You're right to suspect that I was speaking imprecisely here.  We have 
never seen an ARP request appear on the Wintun interface!  I meant to 
say that we have noticed the ARP table for the Wintun interface 
accumulating entries.

>> We _think_ that the NeighborDiscoverySupported property being Yes means
>> that Windows issues ARP requests for addresses on the Wintun interface.
> That seems like a good intuition. I'm wondering whether that's
> something you're assuming or something you read on a Microsoft
> website. I ask because this might provide a good entry point for
> whatever reverse engineering I wind up doing to fix this.
I pieced this together from a few scraps.

On the MIB_IPINTERFACE_ROW page[1], the docs only tersely say:

"A value that specifies if the IP interface support neighbor discovery."

Microsoft seems to use the same terminology when documenting 
SetIpNetEntry2()[2]:

"The SetIpNetEntry2 function sets the physical address of an existing 
neighbor IP address entry on the local computer."

And then, most importantly, MIB_IPNET_ROW2, the structure used by that 
function says this in its Remarks section[3]:

"For IPv4, this includes addresses determined used the Address 
Resolution Protocol (ARP). For IPv6, this includes addresses determined 
using the Neighbor Discovery (ND) protocol for IPv6 as specified in RFC 
2461. "

So, it seems that the "NetEntry" APIs are those that deal with ARP (and 
ND) entries, and the term Microsoft uses for that is "neighbor discovery".

I don't know if the SupportsNeighborDiscovery field of MIB_INTERFACE_ROW 
is implied by other properties of the network interface (such as "all 
Ethernet interfaces support ARP") or whether it can be individually set 
at all.

One other detail is that we have the gateway for the tunnel's routes set 
to 0.0.0.0 (or "::").  I presume that also influences how Windows 
decides which addresses might be on-link neighbours.

1. 
https://docs.microsoft.com/en-us/windows/win32/api/netioapi/ns-netioapi-mib_ipinterface_row
2. 
https://docs.microsoft.com/en-us/windows/win32/api/netioapi/nf-netioapi-setipnetentry2
3. 
https://docs.microsoft.com/en-us/windows/win32/api/netioapi/ns-netioapi-mib_ipnet_table2

-- 
Brad Spencer

