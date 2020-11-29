Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DB6C3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 09:31:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE94C2065C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 09:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=maidenheadbridge-com.20150623.gappssmtp.com header.i=@maidenheadbridge-com.20150623.gappssmtp.com header.b="ag2Ewnxx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE94C2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maidenheadbridge.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 886dbc1c;
	Sun, 29 Nov 2020 09:24:55 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 36bf8353
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 09:24:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id w24so16077239wmi.0
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 01:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maidenheadbridge-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=eB5goXgDly78muw2Y/R/mg217yuaU3pZur52XCmVZic=;
 b=ag2EwnxxtWgfd1wwBzrczh37hQheOvUH1QR4IW69bPD9OS1316QTxvrlt/rGKWW1Nq
 FF+vnC2PnBdozXSKCShAtYdgQoc3tXkqvRrxBe5cEmR9xQySKn6Tfqmaif70JZblsE/k
 99rMCoixWNNdgEG9TDXwlhDHCTWNifxbATvKknMlaejnBzA239yvUubEDAXXMtlZtyE5
 3WWf+TevbBq0gOEPQK4r+B/Ggd23bx0xzjY9HXVsiGGcTYI+vgVp9e5cNWpFTcvDViuu
 cbkqi0TTNwGajFVnkrr+6KcdaoK0bt/meqI1I9lpAlFUVmoOgNg7vc2m9MdXcvpa1Fx2
 Y+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eB5goXgDly78muw2Y/R/mg217yuaU3pZur52XCmVZic=;
 b=N/f/xYtwSgXRgQ31giyWsXaJKgHo92SCvw3qDRK6J4cGg7GuuH3NrsCW/GUM4XQIr1
 ceUbbqx4MmihcRelpAZmFUQUUzMrAPneUPYAgMQDfGFCZuXamB4xk3g9bwNsmzZ1yAKR
 2E1d7yPHmDs3hR8MvPvN2OFrVb89sKcpv95Qy5J3dyQGPRmsMMk0Qy/0OWTLfOIz5osT
 FB46ffB7pGpZBvd1iUCZ90Y6j3UuNV3hwVb/8v8VQaveOi+zIdfaEC4naihftbCz6c1M
 o2DtTQhGpBwV8SVpcuIATxzMnRHnMWTB9YvMJi38xwyIXBhZE/zJSB2aJ29IpbpFJRw1
 rKug==
X-Gm-Message-State: AOAM5324eHFtjbKqw7Xej6Df9kTIhzRqfViu5cCbu7UYtXZWeSWKSG5P
 83vQDesFDfmSEUN+rGJqYzbXQFf3agiTB9/i
X-Google-Smtp-Source: ABdhPJzSUDvl1F34AGJopsNKHbRwJ8EviDRW0iXSTScK8WjUchT7RLaffO+CndQs9Ar86Fq3fHqRdA==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr17913966wmi.35.1606642259812; 
 Sun, 29 Nov 2020 01:30:59 -0800 (PST)
Received: from [192.168.1.140] (82-68-6-78.dsl.in-addr.zen.co.uk. [82.68.6.78])
 by smtp.gmail.com with ESMTPSA id j14sm21980906wrs.49.2020.11.29.01.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Nov 2020 01:30:58 -0800 (PST)
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Clint Dovholuk <clint.dovholuk@netfoundry.io>,
 Riccardo Paolo Bestetti <pbl@bestov.io>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
From: Adrian Larsen <alarsen@maidenheadbridge.com>
Message-ID: <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
Date: Sun, 29 Nov 2020 09:30:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Yes, it is; and is widely common practice.

With Wireguard probably the best is to create a Peer only reachable when 
"ON corporate" network to test the condition and to take action after.



On 28/11/2020 14:28, Jason A. Donenfeld wrote:
> On Thu, Nov 26, 2020 at 9:53 AM Adrian Larsen
> <alarsen@maidenheadbridge.com> wrote:
>> One thing that is commonly implemented in other clients doing tunnels is
>> the detection of "ON / OFF Corporate network".
>>
>> Without any user intervention, the vpn client is capable to detect (on
>> every network change) where the user is located and to active the client
>> or not.
>>
>> Values to detect are a combination of:
>>
>> (usually you can do AND / OR of this values)
>>
>>    1- Adapter domain (i.e. contoso.com) . This comes from DHCP values
>> received.
>>
>> 2 - DNS servers IPs
>>
>> 3 - Hostname vs IP. (This is to create a local DNS A record on your
>> internal DNS server that is resolvable only when you are ON corporate
>> network and not outside)
>>
>> The detection of this values are platform agnostic. You can use it on
>> any client: Linux, Windows, Mac, etc; to detect when turn ON / OFF the
>> vpn client automatically without user intervention.
> That sounds like it introduces a security vulnerability, in which you
> send the magic unauthenticated packets, and voila, WireGuard
> deactivates and you're sending data in the clear.
