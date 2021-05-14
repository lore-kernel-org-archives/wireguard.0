Return-Path: <SRS0=p6Ud=KJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CFFC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 May 2021 16:21:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B204861444
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 May 2021 16:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B204861444
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lemonjuice.tk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5670777b;
	Fri, 14 May 2021 16:21:09 +0000 (UTC)
Received: from mail.aes.pm (mail.aes.pm [51.68.209.80])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c5c79f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 May 2021 15:16:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BCD2A13FAF0; Fri, 14 May 2021 16:16:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lemonjuice.tk;
 s=mailcow; t=1621005364;
 h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=cnr0NpMaYwb7aGNGawQX3fTyRJsGoZuHQF/2QU2oQkI=;
 b=k6LVB3OuzLwEAKVGhnsO5vqmjp1d1iW5EAkkogjseX2ricEP2mKE4dkyyi78MHh+ts0mfr
 nacep3JcPOJNfJUNvEan/iE9jCjbQPY4boiD2oXUmhIZdh0U9gKXQavnvjlvzm666XqZGv
 6xGeQ4QAAaH3ceKhAGh+ihERK1A14BOZVey+RNjOC7FTC40Rhko1wwjtS+2K8P7fFVa0Y0
 BdrEtOYT7clGm6dnw42XvlCl7RYNVe0u0tP9TLrtKW2oy5ZxkMxBqwIjuYH8Q1kCEvVkiv
 cS4wS7VK+XmejLtHHSyAlNMy6cObIL+/SmRPqMRrIDxNqoqa/uSWZxdklzbOcA==
Subject: Re: wireguard.exe no MessageBox option?
To: Andrew Burkett <burkett.andrew@gmail.com>, wireguard@lists.zx2c4.com
References: <CAONL4-+8aiE3tKUn04rp8Zjc=j8vRO56OxLk5k0MoE5aqtURbA@mail.gmail.com>
From: Jonny Proud <jonny@lemonjuice.tk>
Message-ID: <8aa62767-1d62-29ca-cc1a-d5bb9511e7bf@lemonjuice.tk>
Date: Fri, 14 May 2021 16:15:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAONL4-+8aiE3tKUn04rp8Zjc=j8vRO56OxLk5k0MoE5aqtURbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Fri, 14 May 2021 16:21:08 +0000
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

Hi Andrew,

This would be a great idea for deployments using SCCM or SCCM like tools.

It would be best if the installer had a silent install argument 
(/silent), and then depending on the outcome of the install would change 
the exit code of the process. Then you can check the returned exit code 
from the installer process.

Example codes;
0 - Successful
1 - Known Error 1
2 - Known Error 2
3010 - A reboot is required to complete the install.
and so on.

Then a /log "c:\path\to\file.log" argument to output the installation log


Jonny Proud
On 14/05/2021 00:18, Andrew Burkett wrote:
> Would it be possible to add an option to wireguard.exe to output the
> return message for the /install* and /uninstall* commands either to
> stdout/stderr or a logfile? It would make it a bit easier to script
> installation/management to not have to worry about a MessageBox
> popping up with an error.
> 
> Thanks for the great software.
> 
> Andrew
> 
