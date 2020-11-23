Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2888CC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 15:51:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31496208B8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 15:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSduxh4M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31496208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4c348ea;
	Mon, 23 Nov 2020 15:46:23 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b58612a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 14:51:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e7so1351159wrv.6
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 06:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7oL7z5pqQuy+CVTAFJy+fDPmuwVNOOZ528T5TnOq4O8=;
 b=jSduxh4MeQItLG3pBct/8QDC3oCgC59J1B0041CLKh4vLELwIrNpeosKHJdE63A2Sl
 O0j0pjKYc8Fb6WKXGEoUdAhLDoI2MgRMNY5Gms1npsnJgbpSfZHg7rRnBwECbwPUlOLA
 qbrmk4AvNaRmOy4ylRPSDRhckZbmWknBXZhxXPTIzFQHBIVvI6NfDwvXLSWIT8u6mNNl
 Ibd72xKt90hpo7n+RZl0eatYj7ZPtyfRwpM9vu30dODik2iwRd+R/0hmdxsc7qdoYia3
 QtRxzkIwcyYkjgeSxTkDYT4p0P/QmemOYYAhHgbQRQu4fpeNGN2B+98sMv1GeHGjMqIi
 IfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7oL7z5pqQuy+CVTAFJy+fDPmuwVNOOZ528T5TnOq4O8=;
 b=Qs9FTt7RTP4ZmM0SmSUOrP+LWgbLfSVo3dup988dytzAo32pRUXOW6bsFGQsJt83sh
 kc302WOrLnnPxEDqDtpYUAN8pKGyw+vGz+j8LS+jJozm0/nCRXR0bJYmju1t74sMsibm
 IFh1w5BPAbXXMh9bdh39fiyrUD6hnOUNA9LELmxT2HrcCe/ln1nRKyt2e+NMudMTs4uy
 gfNj0vVTHEKwxgsPnxtfxhbdm+GTGewbDAlsmrZKkczAmlvZMqCPsZbXhsf7GjIp4/dA
 MYqbfB/dc/vOZ+CRjjoqcM+U4zwq4JECoA0qMiiZItHP+Y6mS3cOcR2SuOGuq5OO8pje
 3b7g==
X-Gm-Message-State: AOAM532rQ6p1hWBX0SWGOr9SLgicznTKCg4rgrhnTXnnyYOCBqOJ0wWg
 S+PYNDgA861jY8OaccFRoMjj0tWnaGZVKA==
X-Google-Smtp-Source: ABdhPJwj7L+qG6l8W7jAM+Hg1hhdPkBGim23KE20BqaeRDxc+FL0coLgh7ZY4kyL7Bs3vWLZ/Yr9VA==
X-Received: by 2002:adf:a549:: with SMTP id j9mr31241494wrb.199.1606143436257; 
 Mon, 23 Nov 2020 06:57:16 -0800 (PST)
Received: from [10.34.12.4] ([88.226.111.236])
 by smtp.gmail.com with ESMTPSA id p19sm22198736wrg.18.2020.11.23.06.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 06:57:15 -0800 (PST)
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
 <CAHmME9pg02FefvzTR_jESKbM_a=_NQHhkrPFPC5bXbSGDjQ1sg@mail.gmail.com>
From: Fatih USTA <fatihusta86@gmail.com>
Message-ID: <ecb89ed6-085d-8671-c00f-a42bc61496dc@gmail.com>
Date: Mon, 23 Nov 2020 17:57:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9pg02FefvzTR_jESKbM_a=_NQHhkrPFPC5bXbSGDjQ1sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 23 Nov 2020 16:46:21 +0100
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

Hi,

I have an idea but I'm not sure if this is a correct and safe solution.

When you want to install an application, you must obtain permission from 
UAC. If you have permission for the first installation, you can install 
everything.

Idea is here.
In the first installation, we will install wg-net-service with pipe 
socket with the "system" account. This service will handle network 
options (add / remove route, dns, etc.).
Wireguard uses this service via the pipe socket for communication when 
the tunnel is up or down. So you don't need any permission.

Regards.

Fatih USTA

On 22.11.2020 15:55, Jason A. Donenfeld wrote:
> This too is a work in progress, but should give some idea of what's coming:
>
> https://git.zx2c4.com/wireguard-windows/about/enterprise.md
>
> Does it seem like this set of capabilities is suitable for what you
> have in mind?
