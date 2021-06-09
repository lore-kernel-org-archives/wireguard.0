Return-Path: <SRS0=+4rF=LD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B08C48BCD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jun 2021 23:27:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 312FD613DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Jun 2021 23:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 312FD613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdf5153b;
	Wed, 9 Jun 2021 23:27:02 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c18c19ee
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Jun 2021 23:27:00 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f30so40760218lfj.1
 for <wireguard@lists.zx2c4.com>; Wed, 09 Jun 2021 16:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1ecWwVpxGxlSSGlu1U265iqJGX74iQy1ANSIpjiWDKs=;
 b=lZhYlPbNNAFsdjHPLakxTOULMTJYZacHjICrZ8dnNalsC/G0vVH8ZNV3smk+gBgF4E
 GdaoyzyNJ+sQx7SgMP3vSzconVSkU0GK7qIlS0VOC9uVpVwb2qlxJ67ZHbPJVFqaBhsN
 wHVNqvfCt8G4aTek5yousbVlZCYVUYd8NssgnaeEA8xEnbILdCg0O1LIGj38suy0dYIk
 pN1YxKzdfv15gvwHNY3+y6pI5d76f/XrtTkBeJP0QeXlzpJNRa10NhtL7Q4Ir6fQkh3b
 VLbWmotoT92tZn82oa6WvF9pdB0rGMxGZAgn/+K0IuRS2KKQx8sOSOcBWAy19QwsT45M
 U0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1ecWwVpxGxlSSGlu1U265iqJGX74iQy1ANSIpjiWDKs=;
 b=bgpaXShETgh9BSd8nnzUnOzExz3qTytDiW+9kfr4wvGoS3ZLvFX40UmJtV16FM2Ktx
 b1haMcAZ5syzFzIWzJq9J55K6mgvbRPFD7DprPA1Q1ScQY7cZ9kBIvPGoxr7aX9FXt2A
 iJnF4G6E2dGE1qyYIltX5KowKpOpXNDZeYjc0RyNvps/SfWOk3Z6TqHwimU3xocqiI6v
 cWaNyfXkulz8waebBW4PlL1nE6G5WVRJkaojA1+moltfTs79zwnl6i+I5YXYPfqwU5Eu
 VV3PddDFaTVm0L1qKGFhLSWLOkvMt2OWckEkpb7ZihYaW9qYcwOCLUrPs+Ewwpn2gnwy
 0K3A==
X-Gm-Message-State: AOAM532taOYkvDt/ykoJ4ayQ/u128IZM3383N9bqlibriOMo9z3TZn3p
 slAAHBVcjN7r+3OGTIaFR0g=
X-Google-Smtp-Source: ABdhPJxdsDH8obyJ8bFf3DdUipnIKSYGMxLrWa2OGy26WApw2PQZFiwSiClUfkKuvBNtIA6/yXSVAQ==
X-Received: by 2002:a19:514:: with SMTP id 20mr68752lff.472.1623281220085;
 Wed, 09 Jun 2021 16:27:00 -0700 (PDT)
Received: from [10.10.18.210] ([45.15.16.60])
 by smtp.gmail.com with ESMTPSA id u14sm120592lft.164.2021.06.09.16.26.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Jun 2021 16:26:59 -0700 (PDT)
Subject: Re: potentially disallowing IP fragmentation on wg packets, and
 handling routing loops better
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Roman Mamedov <rm@romanrm.net>, zrm <zrm@trustiosity.com>,
 StarBrilliant <coder@poorlab.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>, Joe Holden <jwh@zorins.us>,
 Nico Schottelius <nico.schottelius@ungleich.ch>, peter@fiberdirekt.se
References: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
 <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <b97044e2-10e1-0891-9715-5d4970b88451@gmail.com>
Date: Thu, 10 Jun 2021 02:26:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9rj9M=5G6oh+ZKQjekxWFp-5sF4MWux2==2V4X2UtYkag@mail.gmail.com>
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

Hi,

Talking about my example with chained VPNs. It is a misconfiguration but 
not intentional, and no responsible administrator can solve this because 
client really has no way to tell a VPN provider what MTU he needs. 
Technically VP providers can make such interface for clients but none of 
four VPN providers I've tried during the last three years has this. 
Usually VPN providers just use a default ?wg-quick? MTU in their server 
configs.

On the client side it is (2 local egress fragmentation), client knows 
both of the MTU values, but on the server side it already needs (3 path 
egress fragmentation). If I understand the terminology correctly. For a 
packet on the route: remote host -> VPN provider 1 -> VPN provider 2 -> 
client. An unecrypted packet comes form remote host, the VPN provider 1 
just sends a bigger encrypted packet to the VPN provider 2 and even if 
it responds with ICMP Fragmentation Needed to the VPN provider 1, it 
will be ignored and would not be repeated in the unecrypted channel to 
remote host. So the remote host will never know why the packet was 
dropped and it will slow down PMTUD. How difficult it is and what 
security implications it will have if WireGuard do capture ICMP 
Fragmentation Needed responses and repeat them in unencrypted channel?


On 07.06.2021 12:34, Jason A. Donenfeld wrote:
> Hey folks,
>
> There seems to be a bit of confusion about *which* stage of
> fragmentation would be affected by the proposal, so I drew some
> diagrams to help illustrate what I'm talking about. Please take a
> look:
>
> https://data.zx2c4.com/potential-wg-fragmentation-proposal.png
>
> 1) Ingress fragmentation would not be affected by this and is not
> relevant for this discussion. This is the case in which a computer
> gets a packet for forwarding out of the wireguard interface, and it's
> larger than the interface's mtu, so the computer fragments it before
> passing it onto that interface. I'm not suggesting any change in this
> behavior.
>
> 2) Local egress fragmentation WOULD be affected by this and is the
> most relevant thing in this discussion. In this case, a packet that
> gets encrypted and winds up being larger than the mtu of the interface
> that the encrypted packet will go out of gets fragmented. In this
> case, we could likely respond with an ICMP packet or similar in-path
> error. But keep in mind this whole situation is local: it usually will
> only happen out of misconfiguration. The best fix for the diagram I
> drew would be for the administrator to decrease the MTU of the
> wireguard interface to 1412.
>
> 3) Path egress fragmentation COULD be affected by this, but doesn't
> have to be. In this case, we simply set "don't fragment" on encrypted
> egress packets, which means they won't be fragmented by other
> computers along the path.
>
> So, of those concerned about this, which concerns are actually about
> (2) and (3)? Of those, which ones are about (2)? If you have concerns
> specifically about (2) that couldn't be fixed with reasonable system
> administration, I'd like to hear why and what the setup is that leads
> to that situation.
>
> As an aside, Roman asked about TTL. When tunneling, the outer packet
> header always must take the new TTL of the route to the tunnel
> endpoint, and not do anything with the potentially much smaller inner
> TTL. So with tunneling, you can't quite rely on the TTL to drop to
> zero as you'd wish. Hence, I'm interested in using the natural packet
> size expansion instead.
>
> Thanks for the discussion so far. I'm very interested to read
> clarifying points about applicability to case (2) (and to a lesser
> extent, about case (3)).
>
> Thanks,
> Jason
>

