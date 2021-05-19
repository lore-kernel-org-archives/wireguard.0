Return-Path: <SRS0=veHU=KP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962C7C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 13:49:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A03C9611AB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 13:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A03C9611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5be7841;
	Thu, 20 May 2021 13:49:04 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a2e8e18a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 May 2021 22:28:21 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id z1so13629825ils.0
 for <wireguard@lists.zx2c4.com>; Wed, 19 May 2021 15:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uj9d3a8i8cl+CZV4mep8MzzaVGnZwapnaf4X+DW0wM4=;
 b=Q2Up4s/Qfui45dEDDo8LYCSthgdNDTjuL357HoZ0a6P/RPcVaW8kbIx45DkdcU9zBX
 cY0tNdEy/0Wg8N0mykM9FEjkjRQTH36FlcX+gPl+oOppx2B79cpVBqhR6TPv4zCpvlE2
 flu2eu2LRfevM6JSc6Rn4dZF1xSLYmbziQmKjz0Icgciu4BjA4BVNV/d7fD9QwnB4dxW
 x0B8zIAswR+5O79Qj/qplOFTySTMIGe+aOz93Skgl3XHDUsZ1cRz7skw9JU/Fa1d2uHQ
 TWIWlZ7hkH0EOhwfbh8hO/YzoYUoVh13jWwK6cDnZE7gn/R70luw7WHUdqAeeOj7tUCz
 1WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uj9d3a8i8cl+CZV4mep8MzzaVGnZwapnaf4X+DW0wM4=;
 b=AFlYCvjHp/PbLV37ZZ0/REV4dXMUoMlanA3QfMvllzOdYIp1yPOPtzA5hF0vLWiSdM
 n9Fmd12QuhIg8v7meTIWvJjAT7FYyd2ph8CJjty11uubKeqKhjjGRNQ3/0IHCbcYmbL5
 XZk4qKM0ssqjenW5cubh4qdO9kbtJBXBvK0dEbcqyGAtPUUqTe6OsU6tIzXbSVnmP74Y
 XIj+lUiP5+un+0qPUMo7jW7BfUaIoibBHLx98tMm5gCrAQbs8F4dY8lwfHgvImR833te
 40/9eJc5NI0cRxOUZwgrFIqzqkeNzJtjkGYY+NfjrCaDmK/f0v85v+gD41Q5KuYa5/aK
 2r2Q==
X-Gm-Message-State: AOAM5303wHQhR+4NlKaEqQCApA7UA4vvGqB2QgY4S49tPPM+mVwuQRzW
 FASgsO6P7DIV/z1snhDe2OO2aP4ZrKU6YW8dUtR6EG1Nxwuckw==
X-Google-Smtp-Source: ABdhPJztmAJ2nOCsj02seoDOALC9u3fyMggE6TmB4IgLB/yk4RVSr/KQpWM8Dui4kZoKnHiNeKopNHUzeyJjeXlEwGI=
X-Received: by 2002:a92:c52d:: with SMTP id m13mr1228766ili.191.1621463299847; 
 Wed, 19 May 2021 15:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
 <20210519234310.66ea294e@natsu>
In-Reply-To: <20210519234310.66ea294e@natsu>
From: Vicente Bergas <vicencb@gmail.com>
Date: Thu, 20 May 2021 00:28:08 +0200
Message-ID: <CAAMcf8A9isAqhsXLHw1=8A6pyeDeXBPUan6s7_11_tDXJmg-jw@mail.gmail.com>
Subject: Re: lost connection on dynamic IP
To: Roman Mamedov <rm@romanrm.net>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 20 May 2021 13:49:03 +0000
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

Hello Roman,

On Wed, May 19, 2021 at 8:43 PM Roman Mamedov <rm@romanrm.net> wrote:
>
> On Tue, 18 May 2021 13:22:31 +0200
> Vicente Bergas <vicencb@gmail.com> wrote:
>
> > A server connected to the Internet through an ISP that provides a
> > dynamic IP with NAT.
>
> If it's NAT, then your server has no dedicated public IP? What do you upd=
ate
> to DNS, IP of the ISP's NAT pool (shared IP with many other customers)?

There is a public IP assigned to the router. The IP is dynamic, so, it
can change from time to time, but, once assigned, it is exclusive to
the router.
There is no carrier-grade NAT.
I've configured the router to forward the wireguard port to the
server, so, it is like the server is directly connected to the
Internet.
I think the PersistentKeepalive on the server side is not required. Is it?

On the client side, instead, the router has no port forwarded and
also, i think, there is CGNAT. That is the reason PersistentKeepalive
is present.

> > I think the issue happens when the ISP on the server side shuts down
> > the Internet connection for more than 1 hour! Then, it is restored
> > with a new IP.
> > inadyn detects the new IP and updates the DNS.
> > At this point the Internet connection is operational again, but the
> > client remains disconnected until rebooted.
> >
> > Is this scenario expected to work due to the "Built-in Roaming" ?
>
> It might work, helped by PersistentKeepalive, and as long as the server a=
nd the
> client don't change their IPs/ports *at the same time*. To protect agains=
t
> that, or to improve resiliency in general (and assuming there's actually =
no NAT
> at the server side after all), your client should resolve the DNS record =
for
> the server periodically, and in case the IP changed, call "wg set [interf=
ace]
> peer [key] endpoint [IP:port]".

So, what do you mean is that wireguard does a single DNS resolution at
the beginning and further DNS resolutions need to be done elsewere. Is
that correct?

> With respect,
> Roman

Regards,
  Vicen=C3=A7.
