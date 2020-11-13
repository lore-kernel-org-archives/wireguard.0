Return-Path: <SRS0=wRPw=EU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038A0C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 09:59:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 345822224B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Nov 2020 09:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyFP7KRc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 345822224B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed7a429f;
	Sat, 14 Nov 2020 09:54:22 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [2607:f8b0:4864:20::32b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6621e58
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2020 16:54:02 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id i18so9541865ots.0
 for <wireguard@lists.zx2c4.com>; Fri, 13 Nov 2020 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=XvS1iSeYgelhU0DG+73QKcSJXwich8vVXVg4MAwrpTk=;
 b=gyFP7KRcctTsD4afo//8tBGdxnqpqVBK8pk8MTPCn7al3EP4K4YIKXi8vkh3licwrt
 gVqT6eLe0CMK4jMPzHzSgCGvODXTV4EwqgupguokAyzv59WrwYgt5BG0TlRb5gamQR4L
 EiLy27HxbADtfeWa7yJ9bJiCBL3zfOWi6RY+rwZ6Ez/wPd6ZyQ8Tkdqqtnn6rcjNmPah
 93bZryJSFdDPI+3uIJI11Ec6CSslHDCd9PqicyVL3xLtXTe4Im9Rzntber4+aR5lMMQW
 0IH9405jFzlxtNt0PGYsZCWl90LmW0qoXaR37o8jckEYytNZKBLf7r2MseC2aKS6T8Nl
 fNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=XvS1iSeYgelhU0DG+73QKcSJXwich8vVXVg4MAwrpTk=;
 b=Yv4Q48wQzuckP5IsILPsJb9E54VIb0iLsvCnZ9Dfpl4H4k91cj2+9n+QikIn01Mokx
 PAU6LZ5uJXtKGHAdFnnkUNj+SvwGlKuXki8W5zpznaPnPo41MDJX+mbMzCLWv7r5r44C
 6VdE/N7+JF3cOwr6DUowwcsZPdW31xRZ5t5qb0fIppVOda7U3LqpxqoekKvHWBDMhiTQ
 UtcKYxxp/xl4Sh6RylGSs9W4zm8X4m/l0XaSV8OktpieBxJn5jCQp7qhl3GzkYVGREB5
 pura8WnRBW1QiyJ7C7VID6yiHtnoHj1AZpAAQjk/AID6HpVOMD5jrCfrx8N61xDizpup
 C8jw==
X-Gm-Message-State: AOAM530VBWwddREJ9Fw9gAE5ippmMCmjuKXXgcA8SMqDNy2EngzEMPNe
 17Sy+B3TLlT7EEA0v/W3+d8wDT1mXw1v9g==
X-Google-Smtp-Source: ABdhPJwCal0avvynj6pQiKhcNB7YzqU8KdwDcqGorpVtHlDVX4WpfD41kS+A22y6qipn40YshrJx+Q==
X-Received: by 2002:a05:6830:2083:: with SMTP id
 y3mr2390195otq.203.1605286684274; 
 Fri, 13 Nov 2020 08:58:04 -0800 (PST)
Received: from 2603-8080-d704-b274-a8cd-8171-25b5-0582.res6.spectrum.com
 (2603-8080-d704-b274-a8cd-8171-25b5-0582.res6.spectrum.com.
 [2603:8080:d704:b274:a8cd:8171:25b5:582])
 by smtp.gmail.com with ESMTPSA id e47sm2065359ote.50.2020.11.13.08.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 08:58:03 -0800 (PST)
Message-ID: <a47de6a45010b55c2ddab84e401a81a02f7728bd.camel@gmail.com>
Subject: Re: Hooks in clients?
From: Nicholas Capo <nicholas.capo@gmail.com>
To: Sune =?ISO-8859-1?Q?M=F8lgaard?= <sune@molgaard.org>, 
 wireguard@lists.zx2c4.com
Date: Fri, 13 Nov 2020 10:58:02 -0600
In-Reply-To: <6bfa482b-42ee-ebc3-f2cb-4f52d9d2e219@molgaard.org>
References: <6bfa482b-42ee-ebc3-f2cb-4f52d9d2e219@molgaard.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 14 Nov 2020 10:54:20 +0100
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

On Fri, 2020-11-13 at 16:46 +0100, Sune Mølgaard wrote:
> Hiya,
> 
> I am looking towards deploying WireGuard as my primary VPN
> connection,
> and wonder a bit if the various clients (Android, wg-quick, whatever
> there is for macOS, iOS and Windows), could be made to include the
> possibility of calling external programs upon (re-)connections, in my
> case specifically for port knocking, but possibly useful for other
> purposes as well?
> 
> In the cases of Android and iOS, I am a bit unsure about interaction
> with other apps, so maybe, to begin with, just built-in port knocking
> capabilities could be considered.
> 
> Any thoughts?
> 

In my experence there isn't really a case where the client gets
disconnected (like a crash) and then needs to reconnect.
For me the client always stays enabled, but if there is a problem at
the remote end then packets don't go anywhere.

In other words the traffic might get dropped by the remote (feels like
no traffic *at all*), but I've never seen a situation where I was
accedentially sending unencrypted traffic.

Nicholas



