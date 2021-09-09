Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8460EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 14:34:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 833A860FDA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 14:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 833A860FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=blackberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54c6f453;
	Thu, 9 Sep 2021 14:32:11 +0000 (UTC)
Received: from smtp-pg11.blackberry.com (smtp-pg11.blackberry.com
 [68.171.242.227])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7328ad0c
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 14:32:07 +0000 (UTC)
Received: from pps.filterd (mhs401ykf.rim.net [127.0.0.1])
 by mhs401ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 189EW53F162909
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 10:32:05 -0400
Received: from mhs300ykf.rim.net (mhs300ykf.rim.net [10.12.100.129])
 by mhs401ykf.rim.net with ESMTP id 3ayksdr1ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 10:32:05 -0400
Received: from pps.filterd (mhs300ykf.rim.net [127.0.0.1])
 by mhs300ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 189EJVEa007974
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 10:32:02 -0400
Received: from [10.10.10.207] ([10.4.224.179])
 by mhs300ykf.rim.net with ESMTP id 3axcn6v7ua-1
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 10:32:02 -0400
From: Brad Spencer <bspencer@blackberry.com>
Subject: Wintun NeighborDiscoverySupported
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <00042bf6-4e8c-8638-380d-6774b37f96c2@blackberry.com>
Date: Thu, 9 Sep 2021 11:32:01 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA
X-Proofpoint-ORIG-GUID: DpTcKfm8jqYQMjK2I9k-hCgWLoPDoEW2
X-Proofpoint-GUID: DpTcKfm8jqYQMjK2I9k-hCgWLoPDoEW2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-09_05:2021-09-09,
 2021-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=272
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=1
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090088
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

We have noticed that Windows seems to try to send ARP requests over 
Wintun interfaces.  In our configurations, these don't go anywhere and 
get no responses, but the ARP table fills up with addresses.  For example:

$  arp -a -N 10.0.0.100 |wc -l
387

Our Wintun interfaces are created with these properties:

PS C:\> Get-NetIPInterface -InterfaceIndex 69 |Select-Object -Property 
AddressFamily,NeighborDiscoverySupported,NeighborUnreachabilityDetection |fl

AddressFamily                   : IPv6
NeighborDiscoverySupported      : Yes
NeighborUnreachabilityDetection : Enabled

AddressFamily                   : IPv4
NeighborDiscoverySupported      : Yes
NeighborUnreachabilityDetection : Enabled

We _think_ that the NeighborDiscoverySupported property being Yes means 
that Windows issues ARP requests for addresses on the Wintun interface.  
(The second property controls another neighbour behaviour that perhaps 
could also be disabled for Wintun interfaces.)

Microsoft's documentation for SetIpInterfaceEntry() claims that these 
properties are set "by the network stack", but offers no hint as to what 
part of the network stack does this.  It does not seem possible to 
change these properties on an existing interface.

Are these properties that either the Wintun driver or user-space API is 
able to control?  Should they be set to No and Disabled?  I don't see 
any use of the driver variant of SetIpInterfaceEntry() or 
MIB_IPINTERFACE_ROW in Wintun's driver or API code, so I'm not sure when 
these properties get determined.

-- 
Brad Spencer

