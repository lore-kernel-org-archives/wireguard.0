Return-Path: <SRS0=t+97=OC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C58C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 15:10:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C75561056
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 15:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C75561056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0168282;
	Sun, 12 Sep 2021 15:08:02 +0000 (UTC)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d6b3833
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Sep 2021 15:07:58 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id i23so6139928vsj.4
 for <wireguard@lists.zx2c4.com>; Sun, 12 Sep 2021 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lFluBfEirvrGedaRtRZikex3jOUGHD0lMlL4iOnkGSg=;
 b=CPcs1aidt3EllZ8qWfFgmu3A+hGd2YdVZUSQCZbOzgJjCll5uHeyDeFLXXL1wCGexk
 wowmxoKopekXH85lmX0KA3RT0L+xxpNfTWr+pe0zsvX9479f4lMU/vKiGWGSRNfiuRdA
 vCBcH/jj35k+DX99Ghc4SDkTfv6c4lwFAvulpxcx9ysmDtoo5u5bOy0jEQvNiVWoPu35
 yQWZztpmctrnzUu50RiB0pXXkrn7bKK1OHp+2AgmAbnSGpfJd9CtpJo9jp48Y0Iu0jNV
 Xbj+/ZcJTROa/fbIXGbH9aFhJRhLKq9uaQh7CSKfCNH41jBQ9OW1GR7DIvhCLw9rPvUJ
 Xnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lFluBfEirvrGedaRtRZikex3jOUGHD0lMlL4iOnkGSg=;
 b=jDR5wGFZZaZjOY8+wyV9g/Viq1uuYzli9/snFVLoPBtDGysCchuGInC4VIGCxzjWyp
 W6JB4QCW4sEP6OId4GJWhQgMXoSUwrB6GVPonhBPNa8ndSfQur8SHt7dDzYzpnkdAoeG
 qS1NHmv77O+RfBY22B6foVQNIeOWZ9oFwYYsPifbXaKPoJqGVhMOv85YgNBVv/DCb0DS
 j2Yw1cbBCeTdCG3Gj58gZik10Yo//2J8+6WpZ3LHeA1E947f8IWkYIHml0pspkXDugEY
 5XUIaESns3mDv4/PddrPh5hKA2wC4VLx7sFflgJQbNKTP7X8HT9ocCdeptn02a5HrCeC
 X8Wg==
X-Gm-Message-State: AOAM5312XBArDMOoUCSEHopdRcnxSHWBgcTEoWoHzXr20p2qJfAqsT+Y
 JJVeXPw7zWLUSwviz4V/HBxPL73zu4MnVZ3VaXj8DaI9vH4=
X-Google-Smtp-Source: ABdhPJzeihvt+yRU/GSUeDVAPLfXaP4n8Tzkccsg540z/n1s/IF52oxap6e6/Rm7COqkrOGvH4YT6gxYkuKTpIaFbdc=
X-Received: by 2002:a67:ea8b:: with SMTP id f11mr2736220vso.39.1631459277070; 
 Sun, 12 Sep 2021 08:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
In-Reply-To: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
From: Devanath S <s.devanath@gmail.com>
Date: Sun, 12 Sep 2021 08:07:46 -0700
Message-ID: <CADjMg7VhY5oDjN7KPKkTZd9RhZEK_xZ4SYcs9Q13j5u2e54K_w@mail.gmail.com>
Subject: Re: wireguard-go on windows
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi All,,

I am trying to run wireguard-go (using
"golang.zx2c4.com/wireguard/wgctrl" for configure) on
container-optimized os on GCP and I am facing the below issue. The
same works on ubuntu/centos etc

1) Wireguard device creation and tunnel gets created as required. It
works as expected
2) When the admin wants to delete the wg tunnel interface and recreate
the wg interface.  It gives error "err device or resource busy"

=> To create the tunnel device
tun.CreateTUN(deviceName, mtu).
device.NewDevice(tun, deviceLogger)
=>To delete the tunnel device
func (device *Device) Close()  which is probably calling
tun.tunFile.Close(), to close the FD

----Snippet of the logs, while closing the device and creating again

^[[0m^[[1;33m[22:04:47 2021/09/09 +0000] [WARN] LIsten_WG_API:
userspace wireguard device API interface closed, error while accepting
connection, err:fd closed

^[[0m[22:04:47 2021/09/09 +0000] [INFO] .Close: closed userspace
wireguard API interface and device

^[[0m[22:04:47 2021/09/09 +0000] [INFO] CreateWg: create userspace
wireguard device wg1

^[[0m^[[0;31m[22:04:47 2021/09/09 +0000] [EROR] CreateUSWG: userspace
tunnel interface creation failed, device name wg1, err device or
resource busy

^[[0m^[[0;31m[22:04:47 2021/09/09 +0000] [EROR] CreateWgfailed to
create wg1: device or resource busy

^[[0m^[[0;31m[22:04:47 2021/09/09 +0000] [EROR]new Config:device or
resource busy


Plz let me know if I am missing something.

Regards,
Dev
