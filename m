Return-Path: <SRS0=6+3U=6V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25CEC28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 May 2020 00:58:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF9A20708
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 May 2020 00:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF9A20708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f4db901;
	Thu, 7 May 2020 00:46:02 +0000 (UTC)
Received: from telperion.info (telperion.info [66.160.141.240])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8d0ae429
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 May 2020 00:45:58 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 0000000000044049.000000005EB35D96.00007480; Wed, 06 May 2020 18:00:06 -0700
Subject: Re: WireGuard over WireGuard
To: wireguard@lists.zx2c4.com
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
 <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
 <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
 <CADGd2Dq3-EMBqA6bSKbR=C-pTZToPxv1xkM4BvYGh910T_e1Tg@mail.gmail.com>
 <CAHmME9q0mr_nF7rsWfFmNtAr6+6uv1yA=j6oJAoKZVXamH--zw@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <f88c4fdf-ff31-a489-cb58-c02309016b13@pallas.us>
Date: Wed, 6 May 2020 17:57:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9q0mr_nF7rsWfFmNtAr6+6uv1yA=j6oJAoKZVXamH--zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Note for the list: IPv6 has a minimum of 1280, which means 1360 in the 
outer layer. ~Derrick


On 5/6/20 4:54 PM, Jason A. Donenfeld wrote:
> On Wed, May 6, 2020 at 5:28 PM John Lauro <johnalauro@gmail.com> wrote:
>> Wireguard is defaulting to 1420 MTU, the ethernet adapter is 1500 MTU,
>> and I have IPv6 completely disabled.
>>
>> Can/should the MTU of wireguard be bumped to 1440?
> You could if you wanted. But if you don't do it perfectly on all sides
> with total uniformity and clearheadedness about your network design,
> you'll run into subtle problems.
