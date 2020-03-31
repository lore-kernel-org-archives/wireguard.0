Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64CEC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 12:56:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D1B20658
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 12:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nicze.de header.i=@nicze.de header.b="sSmMuB4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D1B20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nicze.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c94b497;
	Tue, 31 Mar 2020 12:48:54 +0000 (UTC)
Received: from vie01a-dmta-de01-1.mx.upcmail.net
 (vie01a-dmta-de01-1.mx.upcmail.net [84.116.36.115])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2fd9d100
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Mar 2020 12:48:50 +0000 (UTC)
Received: from [172.31.216.235] (helo=vie01a-pemc-psmtp-pe12.mail.upcmail.net)
 by vie01a-dmta-de01.mx.upcmail.net with esmtp (Exim 4.92)
 (envelope-from <suyjuris.gi@nicze.de>) id 1jJGRl-0008j4-W4
 for wireguard@lists.zx2c4.com; Tue, 31 Mar 2020 14:56:50 +0200
Received: from mail.nicze.de ([5.147.172.5])
 by vie01a-pemc-psmtp-pe12.mail.upcmail.net with ESMTPA
 id JGRkjc0yW6Jy6JGRljQOjF; Tue, 31 Mar 2020 14:56:49 +0200
X-Env-Mailfrom: suyjuris.gi@nicze.de
X-Env-Rcptto: wireguard@lists.zx2c4.com
X-SourceIP: 5.147.172.5
X-CNFS-Analysis: v=2.3 cv=GKl27dFK c=1 sm=1 tr=0
 a=/5kknKd2Jpx1Os9ibyM9kw==:117 a=/5kknKd2Jpx1Os9ibyM9kw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=SS2py6AdgQ4A:10
 a=UGG5zPGqAAAA:8 a=VThYpD78DPwjrdR2NIUA:9 a=QEXdDO2ut3YA:10
 a=17ibUXfGiVyGqR_YBevW:22
X-Authenticated-Sender: peter.czerner@unitybox.de
Received: from [192.168.1.51] (p5790B815.dip0.t-ipconnect.de [87.144.184.21])
 by mail.nicze.de (Postfix) with ESMTPSA id 84FEFF2005C;
 Tue, 31 Mar 2020 14:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nicze.de; s=mail;
 t=1585659406; bh=d0/9oCrAINhhRWl4vBWaB3aU4UecispRr3ZQcPYJwu0=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=sSmMuB4SZXFNiJAFWg4Un0k+GLYon2OZXrPoFTfAG1uSFwYDgmiRY4QiCPMlvLArq
 lLvQMfijxgVZPRmrOUZVPa46id2iTh/r2vU3kIy7btXlwb9mAUewK5AYvlgVnmBtny
 zjkE/lS4qeiggKd74XvS6zalwJKLgFMcgoPCsLVU=
Subject: Re: [PATCH wireguard-windows] Calculate the actual route metric by
 summing interface and route metric.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20200327170750.5285-1-suyjuris.gi@nicze.de>
 <CAHmME9r4vDKeWCjp2XF3pKaKUDokDphnVoYBqV5YfLd=gTNbPA@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
From: Philipp Czerner <suyjuris.gi@nicze.de>
Message-ID: <c94c0708-0b1a-0b42-5a15-a7f892d7f008@nicze.de>
Date: Tue, 31 Mar 2020 14:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9r4vDKeWCjp2XF3pKaKUDokDphnVoYBqV5YfLd=gTNbPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHH2Y2Mq2IudpvHzyV+Q4AGSlvctTXS04FbO9KaT2KReyDx6DK92TwquynojYfLR5Nb1EPr4L5+B85DBS4sI3in0wmDbJkL3zLyiwtl/KUd+QwydhqPh
 V/rAkfU7q0tnR6PhgMhKnYJwaVM1jdHKR4SP78pmTnxTzv4lqVmWu30KDluTguioifs10mTg+1ccniLoIXAxXvE9yplmLpMf2Yo=
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



On 30/03/2020 07:31, Jason A. Donenfeld wrote:
> Nice semicolon ;-).

Oops! ;)

> Thanks a lot for this patch and triaging the issue. Nice to hear that
> nested VPNs work. If you don't mind sharing, I'd be interested to
> learn what software sets up its routes in this manner.

Cisco AnyConnect.

Philipp


> Anyway, applied here:
> https://git.zx2c4.com/wireguard-windows/commit/?id=66ad537f4e2144112cb6686c4fc4856d70bf6a3d
> 
> Jason
> 
