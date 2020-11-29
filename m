Return-Path: <SRS0=qAD6=FD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797F7C3E8C5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 12:10:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69E5F20727
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Nov 2020 12:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alDv58Vd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69E5F20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef86dd36;
	Sun, 29 Nov 2020 12:03:40 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 08161395
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Nov 2020 12:03:38 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id j10so12455679lja.5
 for <wireguard@lists.zx2c4.com>; Sun, 29 Nov 2020 04:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmNVKjMdiILc/qhT4Rm15mBZK9TbS+WzQQSP+EwZsaM=;
 b=alDv58Vd1XJdSBxNyup1wAwb/Cr/grNqDWD2o1PRtydJ9suqyt0A9cKOue2Kwz2/h3
 mzlQQdk+OIev6swxFJTdEepaI2hFkMT3CRWeCTd7Y9swdIdDidG3S1lxNsbt7VZrbu/8
 SLBBlqVXi7LxIAG3xDE5u3FhVqk7LZD2wYpIgk2kAOcG3WjHMakf9omaLc8viOlreksr
 fTD1F/RqBo1mqOiiECJ+zSAldw17qw1sHPgPnaZHVREMdshr6tCf7Y0uY+y4BocDeuUC
 tv5IxHmnSD3uX1DJm3HsihtDFeFlSsr/MoQgCdPXUQSBFLDampR0NSfyq0hzTzZNGpxQ
 SOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmNVKjMdiILc/qhT4Rm15mBZK9TbS+WzQQSP+EwZsaM=;
 b=FY7CdK9Pse0OSL9jwRYUMa7894R+MpX7KpRZ5/K8YrIpFbP4I2+tk8Qtex/yd4Vacm
 MJWlf6ugcFthzYrVVRJIfA76JUJPD/pMNC3P6/CrY2psObZrp8iNqvLl2KMmczyLKYc/
 OskYwoO5OHzmx0Mn4ECpPJ8Bw5yEXEmj+A2sG12h0D3wGFDjIzIWTMj/4i0VKWAqzlTW
 HRR0tlNUBouG1Kb/4qmSmoqx2Kq9uHMQ2Z2dBxVcV1knzO+d7pb4em9W7DTx9DoEkC6Y
 kj5oa74NFbrwGHxeuAZjvHN5fwVa2vIynpY5TB/xfQBz3ehabOxMBbOer3kp5CxTK1AN
 y1WA==
X-Gm-Message-State: AOAM531qkGkbIjvwDgsppWXcYPiMyK3L14YU4G4usYBsi9KK4Ofab/VC
 i1aZpwGyazgAEvpu9667zs/+/vUaEXPZFaUDTos=
X-Google-Smtp-Source: ABdhPJy21jIzxb32ohBmfJ4geASpzeHw8Pf8sa8sJN4jPH9rReoJ76MDGynaFNBN+sITGEsu6589kUKTVhOI3Xv6SuA=
X-Received: by 2002:a2e:b889:: with SMTP id r9mr2815910ljp.206.1606651786373; 
 Sun, 29 Nov 2020 04:09:46 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oMFQtePYt37+4eyOn23mwHwP2UGxQi=SaJk9J3p1zCpw@mail.gmail.com>
 <C7CEJYWC3YU7.2DQYKR91NB6CP@enhorning>
 <8bf9e364f87bd0018dabca03dcc8c19b@mail.gmail.com>
 <CAHmME9pdDDjVWmxGdh42tJy2KbxT7ZSj9PEsjEyHRMwZpora+A@mail.gmail.com>
 <d9dc454a-15fd-a547-8d0f-b7916818c3de@maidenheadbridge.com>
 <CAHmME9q_UbmfVyd9hH5+b1n6pE=mOgZdKMcyF=AFf2Nm0QHumg@mail.gmail.com>
 <3b4f9ec2-2f50-25c9-0e27-7ca0d2f16943@maidenheadbridge.com>
 <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
In-Reply-To: <CAHmME9pP4u5-HjZcdj0SAymGmoG36kA0sbcvRo7=mr8XZ-RXHA@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Sun, 29 Nov 2020 13:09:11 +0100
Message-ID: <CABtXGiD7Q4904nit3C=A12AnJh0rmLeW3skhPoWXEYdP2mLTXw@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Adrian Larsen <alarsen@maidenheadbridge.com>, 
 Clint Dovholuk <clint.dovholuk@netfoundry.io>,
 Riccardo Paolo Bestetti <pbl@bestov.io>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Interesting thread to follow.

My larger concern here is that without an officially provided method
to run wg as non-admin on supported Windows platforms the following
may happen

1) Limited proliferation of wg in the huge corporate/SME space, or
similar cases where end-users are not admin and don't have access to
any form of admin entitlements, to provide modern management of VPN
config and security. This would be a huge miss. Network Configuration
Operators permissions would not be permissible in most orgs for
end-users.
2) Without that in a place a high probability of mutated versions of
wg existing all with varying quality of implementation for a non-admin
solution. This I think has the real potential to taint the reputation
of wg as a whole and misses out on a full native method to address
what I think is a huge use case to solve for.

I cannot imagine that the corporate and non-admin use case isn't on
the roadmap for wg. Maybe I am wrong, however, this thread doesn't
make that assumption any clearer.

On Sun, 29 Nov 2020 at 11:55, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> >>> One thing that is commonly implemented in other clients
> >> That sounds like it introduces a security vulnerability
> > Yes, it is
>
> I don't mean to be rude, but shouldn't the line of thought sort of
> come to a natural end there? We're trying very hard not to be in the
> business of creating security vulnerabilities, after all.



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
