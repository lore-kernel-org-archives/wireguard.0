Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09796C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:40:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2970F60EFE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2970F60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 733d24eb;
	Fri, 27 Aug 2021 14:40:52 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dc186cf7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 14:40:49 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id x5so7238184ill.3
 for <wireguard@lists.zx2c4.com>; Fri, 27 Aug 2021 07:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLM2Gvf6qzOIMSIFLE171Q5mnXwiR4HigQPmw7K4bcw=;
 b=p5wSutUNo+AYppXTtDsAPf7RQsBa3c6SkR3LXvQExpmCp6zF+NhhQpWyngVku+veMT
 4rQT4QG2W1HV31WNVwfVkAhAy+9O/LfbUYptao2S5phMLlkLTZBzpglvWiBXO0IibuRN
 9/mBRqRggixUQxT7VdUXTFWP2Y9t25Y6WPhkigLQrk9XzqOii8WyG5J462WHhFXcyzd6
 4U0IyIltThbWEsj2GB/Rr4ZseD+5jKEuBkJ/XhwXYmXiUIU63azpVPWriNReAaEmNmrx
 g0ok30fRZU0hx7CAuyMfkV1vwWI1AGA+ArjUOhZDiIkC4XEjBrqPYj0Fk2CG3MfI7NfG
 exGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLM2Gvf6qzOIMSIFLE171Q5mnXwiR4HigQPmw7K4bcw=;
 b=jCW5LHP5Os350YuM8fustF+X2aKiM6UQyJWNCdywJbXINOUDYeqlFRi7bwISt4nSEd
 3uOXhop1lldbVSpe6OmhaAOjWfwqsY+K5kOGuPAU/lVXAxsBP9cB/UGw8wtbixP3Blzb
 Tixv5ny+P/adqnBQglEVuMcugRtuLLnVI9QDTDdASH4Twtdytq//bEjtR6rXTGPRoapE
 ZA0ukn9jMVe9LGHAPJk7ST+l7hT8ewhCcGZTn9JPGLMYaRIBglHxWGS0Mf/cGN7BHcMQ
 kivdEyGwYaAi5CBVVac+fA9ZqnjyvpBpNr8s3Ke6V01MjP5mENTk8anei2K8W/5KfEaO
 1rpQ==
X-Gm-Message-State: AOAM5329nvsFKrq/vtO6MAcu7Xm/ccEJ6i/S//mFQIWvgE1H6y3Tcie8
 koQ9xxq3ja9e3RQL6CuB5cHXn3gu23QSib2FbYqxgoZ6
X-Google-Smtp-Source: ABdhPJwv27mZo4TCr2mE5alwkCcxHO2l73No5UCCzPCDzgIAFu5xub+PWkJbQ/WhI98He6RHkt9xc2JYVJL06bffI3g=
X-Received: by 2002:a05:6e02:1c2b:: with SMTP id
 m11mr6773719ilh.242.1630075248013; 
 Fri, 27 Aug 2021 07:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABK1yFAx0mLhx1jj=WmAfLewvzea6n4hwhabY4RNG137smBiFA@mail.gmail.com>
 <CAHmME9ooDHz4-o0EZzNu1bHOrqDn5NNz-Kv+7Y2B4hLbff9nng@mail.gmail.com>
In-Reply-To: <CAHmME9ooDHz4-o0EZzNu1bHOrqDn5NNz-Kv+7Y2B4hLbff9nng@mail.gmail.com>
From: Gopakumar Choorakkot Edakkunni <gopakumar.c.e@gmail.com>
Date: Fri, 27 Aug 2021 10:40:36 -0400
Message-ID: <CABK1yFAsb8uKe+rDrhg9CsE-Sw+qr-SzmL5t5mJcSdkfjsfCDQ@mail.gmail.com>
Subject: Re: wintun0.13 memmod load fails in windows10 (wintun 0.12 loads fine)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks for the response Jason. My reason for trying 0.13 version was
because I "thought" 0.12 had some issue because I was seeing random
packet loss (I had another email thread for it) - but then I figured
the random loss was because I was doing a device.New()/device.UP AND
also reading wintun from my own goroutine, so two of them reading same
queue. Now that I fixed it, I am happy with 0.12. I will wait for the
next wintun release which has this memod load issue fixed (0.14 ?) and
upgrade directly to that

Rgds,
Gopa.

On Fri, Aug 27, 2021 at 10:11 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Update to the latest wireguard-go commit.
> https://git.zx2c4.com/wireguard-go/commit/?id=bad6caeb82edd0e22bdbcfa1ca544a5805109e14
