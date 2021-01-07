Return-Path: <SRS0=PSWY=GK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A7EC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 21:56:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F75723435
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jan 2021 21:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F75723435
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6eb5037;
	Thu, 7 Jan 2021 21:55:15 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bde2620
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jan 2021 17:01:44 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 107H1dHT125554; Thu, 7 Jan 2021 12:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=g/07yt6F6iI0Q4WiX8eb4mDvryw79jBaT6FXa8eHMws=;
 b=gAjCbjlYdTTq0XaGaKimgU/Nz9+1MrvpWVpsx7F+pVxKonNHA/wWnfXCUHGACjssubXi
 awU0KfP85g9Wu65uhRbU6DItw/MgxHt4/lxS/xLGBsdHVmVaGlAS8Doiz2KSdxX1paMQ
 Zpf5Lx4tARAtIyv9yso3Fvdoh536gtO95oUZ8wz8hc0Uv15RFXFLHLRQpvp/9Y9GK6b+
 MD6kGhWh3j3a4FMfEQuCYZwAlOb26VjJKh6EbBZsu2lMBgjMuQ6LYHE2k/B1jitaK5GG
 0aa+qaUM2JrcWw1mLMUBMnycujB4l/RWrqH8RzgDyNVnzgITSEP56+jtDEyB2hZJ1fGU Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35x5dxa20r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 12:01:40 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 107H1bOp125453;
 Thu, 7 Jan 2021 12:01:40 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35x5dxa1ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 12:01:40 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 107GcNek024585;
 Thu, 7 Jan 2021 17:01:22 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 35tgf8amx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 17:01:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 107H1KVQ22872364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Jan 2021 17:01:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6377F11C054;
 Thu,  7 Jan 2021 17:01:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F70C11C04C;
 Thu,  7 Jan 2021 17:01:20 +0000 (GMT)
Received: from [9.145.66.183] (unknown [9.145.66.183])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  7 Jan 2021 17:01:20 +0000 (GMT)
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Dmitry Vyukov <dvyukov@google.com>
Cc: Kees Cook <keescook@google.com>, Netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eric Dumazet <edumazet@google.com>
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
From: Julian Wiedmann <jwi@linux.ibm.com>
Message-ID: <68452c93-de95-aaa6-3cac-d868a202ea6f@linux.ibm.com>
Date: Thu, 7 Jan 2021 18:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-07_07:2021-01-07,
 2021-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070098
X-Mailman-Approved-At: Thu, 07 Jan 2021 21:55:11 +0000
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

On 21.12.20 12:23, Jason A. Donenfeld wrote:
> Hi Dmitry,
> 

...

> fall on the border of a mapping? Is UBSAN non-deterministic as an
> optimization? Or is there actually some mysterious UaF happening with
> my usage of skbs that I shouldn't overlook?
> 

One oddity is that wg_xmit() returns negative errnos, rather than a
netdev_tx_t (ie. NETDEV_TX_OK or NETDEV_TX_BUSY).

Any chance that the stack mis-interprets one of those custom errnos
as NETDEV_TX_BUSY, and thus believes that it still owns the skb?

> Jason
> 

