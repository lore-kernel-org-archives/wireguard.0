Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E7AC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 17:35:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5161A235DD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 17:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5161A235DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=blackberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9afa43ae;
	Thu, 17 Dec 2020 17:26:27 +0000 (UTC)
Received: from smtp-pc10.blackberry.com (smtp-pc10.blackberry.com
 [74.82.81.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16dc1dec
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 13:58:50 +0000 (UTC)
Received: from pps.filterd (mhs400cnc.rim.net [127.0.0.1])
 by mhs400cnc.rim.net (8.16.0.43/8.16.0.43) with SMTP id 0BHDxriv165697
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 09:07:20 -0500
Received: from mhs300ykf.rim.net (mhs300ykf.rim.net [10.2.24.129])
 by mhs400cnc.rim.net with ESMTP id 35g61y88c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 09:07:20 -0500
Received: from pps.filterd (mhs300ykf.rim.net [127.0.0.1])
 by mhs300ykf.rim.net (8.16.0.43/8.16.0.43) with SMTP id 0BHE1uOL014212
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 09:07:20 -0500
Received: from [10.242.25.74] (ci0700000002091.rim.net [10.242.25.74])
 by mhs300ykf.rim.net with ESMTP id 35dccnfgmj-1
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 09:07:19 -0500
To: wireguard@lists.zx2c4.com
From: Brad Spencer <bspencer@blackberry.com>
Subject: Unexpected error re-initializing Wintun 0.9.2
Message-ID: <0c6e326e-139c-012b-fb47-95cc85560485@blackberry.com>
Date: Thu, 17 Dec 2020 10:07:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_09:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=562 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170099
X-Mailman-Approved-At: Thu, 17 Dec 2020 18:26:25 +0100
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

Using Wintun 0.9.2 on Windows 10 Enterprise 1909 x86_64, creating an 
adapter (and then deleting it) works fine.  And, using the API to move 
packets in and out also works fine.  But, if we create an adapter, then 
delete it, and _then_ try to either open or create again in the same 
process, we get an unexpected error.  For example:

 From `WintunOpenAdapter()`:

```
wintun: NamespaceRuntimeInit: Failed to open private namespace: You were 
not connected because a duplicate name exists on the network. If joining 
a domain, go to System in Control Panel to change the computer name and 
try again. If joining a workgroup, choose another workgroup name. (Code 
0x00000034)
wintun: WintunOpenAdapter: Failed to take pool mutex
```

Alternatively, from `WintunCreateAdapter()`:

```
wintun: CreateAdapter: Creating adapter
wintun: NamespaceRuntimeInit: Failed to open private namespace: You were 
not connected because a duplicate name exists on the network. If joining 
a domain, go to System in Control Panel to change the computer name and 
try again. If joining a workgroup, choose another workgroup name. (Code 
0x00000034)
wintun: SelectDriver: Failed to take driver installation mutex
```

If we create and destroy, and then start a new process, we can create 
and destroy again in that process, but only once.  It does not seem to 
matter if we create a session on the first adapter before destroying it 
or if we actually use it or not to move packets.

We have tried sleeping for 10 seconds (and much longer!) between 
iterations and it seems to make no difference.

Are we misusing or misunderstanding the API?  Is this a bug?

We have created a small stand-alone program that demonstrates the bug on 
a freshly installed Windows 10 Enterprise 1909: 
https://github.com/b-spencer/wintun-adapter-error

-- 
Brad Spencer

