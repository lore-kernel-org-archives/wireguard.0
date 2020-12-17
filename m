Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6303C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 18:30:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3373E2389F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 18:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3373E2389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=blackberry.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efe11f04;
	Thu, 17 Dec 2020 18:22:14 +0000 (UTC)
Received: from smtp-pc10.blackberry.com (smtp-pc10.blackberry.com
 [74.82.81.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id de2fbd63
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 18:22:12 +0000 (UTC)
Received: from pps.filterd (mhs400cnc.rim.net [127.0.0.1])
 by mhs400cnc.rim.net (8.16.0.43/8.16.0.43) with SMTP id 0BHIQtc3083679;
 Thu, 17 Dec 2020 13:30:43 -0500
Received: from mhs300cnc.rim.net (mhs300cnc.rim.net [10.3.24.129])
 by mhs400cnc.rim.net with ESMTP id 35g9yqgd53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 13:30:42 -0500
Received: from pps.filterd (mhs300cnc.rim.net [127.0.0.1])
 by mhs300cnc.rim.net (8.16.0.43/8.16.0.43) with SMTP id 0BHIQYWl030399;
 Thu, 17 Dec 2020 13:30:42 -0500
Received: from [10.242.25.74] (ci0700000002091.rim.net [10.242.25.74])
 by mhs300cnc.rim.net with ESMTP id 35dca8828f-1;
 Thu, 17 Dec 2020 13:30:42 -0500
Subject: Re: Unexpected error re-initializing Wintun 0.9.2
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <0c6e326e-139c-012b-fb47-95cc85560485@blackberry.com>
 <CAHmME9oRUm_D7QSA+zFB8cHW9OQZ-rq4pmDGY1G86VbcUBZaEA@mail.gmail.com>
From: Brad Spencer <bspencer@blackberry.com>
Message-ID: <652c9044-ecee-5392-b7d1-fe581c882514@blackberry.com>
Date: Thu, 17 Dec 2020 14:30:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9oRUm_D7QSA+zFB8cHW9OQZ-rq4pmDGY1G86VbcUBZaEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_13:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 mlxlogscore=760 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170126
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

Thanks!  That makes sense.  I didn't pick up on the fact that we were 
loading and unloading the library, or its significance.  I agree that 
there is no reason to do so.  I think we just ended up with that pattern 
as a natural step in our migration from the pre-0.9 API.

BTW, I know it's unusual, but we find that the word "not" stands out 
more clearly than a lone "!" character.  I guess a few slipped in to the 
test program. :)

-- 
Brad Spencer

