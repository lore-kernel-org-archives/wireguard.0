Return-Path: <SRS0=U1SX=KE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B32C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 May 2021 06:17:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D368861075
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  9 May 2021 06:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D368861075
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dce46ec;
	Sun, 9 May 2021 06:17:17 +0000 (UTC)
Received: from sonic313-22.consmr.mail.ir2.yahoo.com
 (sonic313-22.consmr.mail.ir2.yahoo.com [77.238.179.189])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16f7f228
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 9 May 2021 06:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1620541035; bh=gnpgiwf7uqrRXLCi56erdQRmfNr0KT+JaSHsMrNZoDY=;
 h=Subject:From:To:References:Date:In-Reply-To:From:Subject:Reply-To;
 b=iqsM68bBksPF5LHgtNJ2UVJYPUWFXon6EwDSJ6zkNu8qiurtJOnfMLxCZ9BJEmxHELN0fdAX6zv1+HrRjlQG3jbsdRitR897lJZHF6NhOMTU4LQRat4X0saT0HMfIWOmYiwpC+A4kc/wKd0ToJ/eUvzjRb01JqIKktewLf7UOAZPMBIId+tsOJ9gwf6qkccdRmJGtLisEt6WVY3V974MraTis+V7jBqb3mhlOxi1c0z5Zg68mgLh4VEes3fEY+u0j3OIVcw2U2K6ksvWi9IbdtB+Yr593urARuJr4LCn5jTuifOVhTSviz6/NYwRJBY5FU72pfteaINGor6pOad3LQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1620541035; bh=9guu63BSDOIHT/fVXM1CDO2PuT37ZPWoTGVxhSATzJ6=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=Hxop0SbYnM4kvNW0jx+tp5DFTu97EVnJFHxIh5fIbFGtgwkhtdr6vvk6zt1UsI4AWhr/FUmNR0aDSSQQufTmwgUJ5r1zQP1MMuQIb+txUvnc/T5ar/qim/ec3EExhtzlX4C9Fwl5LZhFEdcfv4wvjsoGPL9UhlphsDZAZX/6gElv/3lJcwJxbgF5iE1kFQVlyqFjV7y/6aHbPzcmLZC+M+5NDjM7LZHxVGTroIQ2Y+UuY5Cbw4xO1+IugoEiwioOOTgdbR6VpqFPXlDtkKdnSZr5uBP8aGd4BCSvsliI+cmWKznW90Gmtig+YclqpEPLiNehrmK276MQWkCo/smSXw==
X-YMail-OSG: WHfLxskVM1mN93VszHQdyiq8WrqxwsQdUBFfCirh0vdZK99Ue35MjF0rCLpakRg
 OSFdq67TYIWCUWmmBJ6fzi4vzQf60dyAOcyEAVl_vm0y69znXZPsnOQ5eXXNNOtyqdki6Is0DEF2
 kBdKbNE3idCEOyx.R.Nao_lavXHovr71vStP1Gc8mj3eNUQ21s5R8GA3BXVicTbuzt1PPAIh896Q
 LIi3zDoB_bD8D7pbItsOj4P.l73RueHCNJo6U4cwewJ8cOMSYcydLH8qkmpA2x6eiD_sDHzlrV6_
 8j42lNsmhQY3LIY_ys.8nC3oVQpJcj7GIAg6sJcUBp0gahR738mtAHQjyamGjIyXxhcO.NDD5Z_L
 NGfh8.Od0_MpqUdSRrt0RWHEayZaEwc7wQdCx0TnOp_tNvi.P8HsaO4rj2I0_5qOPKCR3x99cCj5
 obi6z7pi3e.HAwhs8dC6EYMDv.Z71U2twiQhYzkd16lb8f_h_S8aV17vJi5PW4UEa1Xu3fi5Swj1
 Ab.hQlQHQy3YRoXVs_R8nIwZM9p5Fmax0tuBOkHa7F._OCGJHDGf3OkWdyMfmjC1wcdG1enWIDOQ
 wtoLz7arJA3q9OwYhePIPFtgm8RBKQYe28idEBpCDhmI86YXASeUHLmVG20jK5ncsCFaIS4y9XZI
 bVlKLjALFFfRELa8rSYfCeakJliPq5kxiVjYP2iPPENA4T513WOA6B.QGdq7wUhDQMHHBdHdcVqL
 Eq_QUGP.eFhnfvrF9d.cfsAcACgmBO3ldzT1FEv5dJQYNpN2C8gSlepwOqdHZ.OEhKOz_arNVyv9
 yI9LgLAKgQBCvCmfNPYGszRqDZpLExiJjaRwSxF5tgDdsS3P6a3STdNyAXg1CUcFlVXGdH_SWfvP
 Rbf1hjjEAplILLcoen_LZs1DWCT4_TCGG0SulFzhqtEfsPddO5GtnY9VV01zTktF_TbHsTyW7.Lx
 9mTcLMubPS.4fjwdwS99crrPxhqa5rkU.WH3n.Q9QjqSOLeHw4IAnV_RLifYnTGBvdB7.3TZ2HZF
 I3BucLOCyUzjNKALZjbAi5VyQp9mDL4j_1.AGdOFueHCdZfGuMrOPHU9RI_LSt1WlvznLIJk1OJ6
 eIiRO0GCtA8P9.aFkDOe0Y60YOUuWCx7WxML7zkzCSKFF6FlabYnlFanbt4tP1ERv9fHqTj80L2C
 f_Q0Cxtp0sl90.rNZ5YKgYHt1ZiISffPUdbDaQtZkH_doIBFoAHZXoFKkwenHSqmXF72OmTcFSRf
 XnjNNoLsc.qJefhMLOYKWKw6VJsZ3gAJQhk7PZT8PXTQxo0eKQyr47j4HGprIS6Z_k16VkMGa6q3
 LCG1Y5G8WXILatQGXop.mnt1yG4VkOdoiEK6UM.BZUrRx8aeyYS2tmW9JyMEOjCZzF3I3SLuAz8H
 7uqCsP6bEEEauSW8AyRfDg4k5Tbf6waOKs2M_ok7JRRjEH.JSAbWAuv_8xUYWx7bGYjwV4cmETLM
 tnpOomYY1Hj9vzyDI.cS6GfI.ukFNS7TYIjiBLVP3TGCNYi3qc3GKluo8T1m3vi6QoEPUlatdo6g
 KxClqHXY6g5w9IhrQhwW2QPl.TgTQxmXtJm2yxvv3JRt6SurVXJ3aUozWTOCIRCZc5XKpDgp6gAr
 j1WBxIedQVl9Xieatir5H4GtBo.zhaptGCuGIaLrVygMmVwcYwcpXlrTk5LGDPzUpVpjj55Rr6WH
 Q2zR5Eyqt1xJoC.V7xi8d5kv0RSNPVGlDB4HF3n8hwHw72Eg81LxHyeBvHNkq1bVK9vAifNHFbsF
 yzAIuo37Bj7ViBhzc8iO5S_YuCg8JP8zYfHDr.RQxc2gfGUTThdAC2HW2KCC8D0RHE604Xn8dkTq
 CU815s3_YqV9wRjDZgwCj6VoiGmEWgtvIBA1qA_Mt2WfUSJ2x2frZkFiMXK3_1mixXejhToUQn2_
 qRwRw.ffKx1keQ_G9PA9GNjUyjgYYh8CjO0E27zxaNi7_G2.CV_hNBIlklQR7SL_XTxXLGHVUBu9
 ylIhy5jS8PMnCpmqAKBy4DVLGJf4gbdMDjdIte8hy.gP63_jvmHWEWqCLXYgpDzIIzEvVx5FWQhX
 Aq9jj3g7Fn6R3oq2cO8RVD_0UOfzVplprRn3PccJVsFoQtkPdcsoRuDOLeacPndML_jZ7qJFyAt3
 YWLZwqPrP4PLTO5.YEWIAaVcWb1Wmm4lt3R.HluuhZXPz.h7t.6mBU_pJWtZiUa9_l9cF.xEvaaK
 mFCrU7vAPlkqgvj8_gX32mWAazxedmSG2BAWY6ouwipFooX_Yl1ZgskRYiSu5qOYzrq3XQk8aq56
 ubuTUmRDpYupHaa6XlnfkdcX9Yiah2rIzZS9TWjeI5mCXZz3lD9vGxVxXkPoiUNyFrCub89ujLKt
 k5_jJnfDOgwgz3dp6mUIJA3CNzqc44nbyMP4KNU4M7IRXUt2G9uGkSWc3JzctUE87Cpg-
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ir2.yahoo.com with HTTP; Sun, 9 May 2021 06:17:15 +0000
Received: by kubenode523.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 9c43f827a44202ea48817cb3308eb300; 
 Sun, 09 May 2021 06:17:13 +0000 (UTC)
Subject: Re: secondary IP on wg0 fails
From: lejeczek <peljasz@yahoo.co.uk>
To: wireguard@lists.zx2c4.com
References: <204f6e7b-d594-c2c0-5242-1643055065c3.ref@yahoo.co.uk>
 <204f6e7b-d594-c2c0-5242-1643055065c3@yahoo.co.uk>
Message-ID: <61cb8e11-0441-6f4a-891e-7c5800391ead@yahoo.co.uk>
Date: Sun, 9 May 2021 07:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <204f6e7b-d594-c2c0-5242-1643055065c3@yahoo.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailer: WebService/1.1.18231
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/16)
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



On 08/05/2021 17:31, lejeczek wrote:
> Hi guys.
>
> I'm experiencing a pretty weird wireguard, or perhaps 
> kernel/OS stack bits behavior.
>
> I have three nodes which all can ping each other on wg0's 
> IPs but when I add a secondary IP:
>
> -> $ ip addr add 10.0.0.226/24 dev wg0
>
> it gets weird, namely, say when that sec IP is on
> A -> B ping returns; C ping waits, no errors, no return
> B -> both C & A pings return
> C -> neither A nor B ping returns
>
> I'm on CentOS with 4.18.0-301.1.el8.x86_64.
> All three nodes are virtually identical kvm VMs.
>
> any suggestions as to what is not working here or how to 
> troubleshoot are vey appreciated.
> many thanks, L.
>
>
>
>
What I've just noticed for the first time is, config eg.:
..
[Peer]
..
AllowedIPs = 10.0.0.2/32, 10.0.0.226/32
Endpoint = 10.1.1.224:51852

[Peer]
..
AllowedIPs = 10.0.0.3/32, 10.0.0.226/32
Endpoint = 10.1.1.225:51853

 > $ wg
interface: wg0
   public key: c+gJArxYd8+=
   private key: (hidden)
   listening port: 51851

peer: K/=
   preshared key: (hidden)
   endpoint: 10.1.1.225:51853
   allowed ips: 10.0.0.3/32, 10.0.0.226/32
   latest handshake: 16 seconds ago
   transfer: 124 B received, 2.14 KiB sent

peer: /KidNfhqgP/+c3A=
   preshared key: (hidden)
   endpoint: 10.1.1.224:51852
   allowed ips: 10.0.0.2/32                # !! no 
10.0.0.226/32 ?
   latest handshake: 3 minutes, 15 seconds ago
   transfer: 180 B received, 92 B sent

That is probably why only 10.0.0.3 with secondary IP is 
"reachable". Right?
If that is by design and expected - why is that and how to 
make a "floating" IP work if that is by design?

thanks, L.
