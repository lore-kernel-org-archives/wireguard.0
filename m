Return-Path: <SRS0=IEsR=F5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF31DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 14:43:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1760622255
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1760622255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=03s.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd3606dd;
	Fri, 25 Dec 2020 14:33:27 +0000 (UTC)
Received: from cyan.elm.relay.mailchannels.net
 (cyan.elm.relay.mailchannels.net [23.83.212.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62bd3112
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Dec 2020 06:34:23 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|03s_mobile@tclish.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 7133A18198C;
 Fri, 25 Dec 2020 06:43:53 +0000 (UTC)
Received: from pdx1-sub0-mail-a44.g.dreamhost.com
 (100-96-5-6.trex.outbound.svc.cluster.local [100.96.5.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 12743181A43;
 Fri, 25 Dec 2020 06:43:53 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|03s_mobile@tclish.org
Received: from pdx1-sub0-mail-a44.g.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.11); Fri, 25 Dec 2020 06:43:53 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|03s_mobile@tclish.org
X-MailChannels-Auth-Id: dreamhost
X-Keen-Share: 2a588dbc7578d86c_1608878633286_2659937034
X-MC-Loop-Signature: 1608878633286:1498082671
X-MC-Ingress-Time: 1608878633286
Received: from pdx1-sub0-mail-a44.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a44.g.dreamhost.com (Postfix) with ESMTP id C586B7F3D2;
 Thu, 24 Dec 2020 22:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=03s.net; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=03s.net; bh=DOq1ZM1mM
 u766gXsqANgvnsMxKI=; b=XRS/dlWlwPG7ebBiteu6bsXKljALfnHQlGp3WvQPx
 XiRxIrzJf9ufgmZnmC1URv8RJVuG5xY7Y4MHgjOKmchGLue3wpTMq89qYWV254ET
 Ahxo1fCB3o85GCG9jG7vLN6/pBmUf8SgEd/SEC+t4KETYouX8zC0BYseV5OZfvr8
 wo=
Received: from [192.168.99.135] (unknown [112.199.247.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: 03s_mobile@tclish.org)
 by pdx1-sub0-mail-a44.g.dreamhost.com (Postfix) with ESMTPSA id CB9E57F544;
 Thu, 24 Dec 2020 22:43:51 -0800 (PST)
Subject: Re: Best practices for adding hosts
To: wireguard@lists.zx2c4.com
References: <CAF-5T9FDVTqPGsS=FcMMyWy2W6O1w7ShdhEEsGUAaQ+fnTMnVg@mail.gmail.com>
 <9B2F58B7-92A3-425E-9B28-DF715B5B5503@tomcsanyi.net>
 <CAF-5T9GDLTTrcgmGcT=YaLbUmEHSmNyE6_X6Xcvof3bcc6HXEg@mail.gmail.com>
X-DH-BACKEND: pdx1-sub0-mail-a44
From: Adrian Ho <ml+wireguard@03s.net>
Message-ID: <de4d8653-0fa5-97ba-0f08-8f675c2e12aa@03s.net>
Date: Fri, 25 Dec 2020 14:43:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAF-5T9GDLTTrcgmGcT=YaLbUmEHSmNyE6_X6Xcvof3bcc6HXEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 15:33:24 +0100
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

On 21/12/20 8:51 am, Ronan Lucio wrote:
> I tried executing it manually and got this:
>
>      $ sudo wg syncconf wg0 <(exec /usr/bin/wg-quick strip wg0)>
>      -bash: syntax error near unexpected token `newline'

Your command:

sudo wg syncconf wg0 <(exec /usr/bin/wg-quick strip wg0)>

has an output redirection character ('>') at the end, so bash was 
expecting a filename after that, but got a newline instead.

Best Regards,
Adrian

