Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7F8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 00:17:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10CE0614A7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 00:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10CE0614A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f78e19f2;
	Tue, 9 Mar 2021 00:17:32 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8cee0aa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Mar 2021 15:02:38 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 1F13A873AE
 for <wireguard@lists.zx2c4.com>; Mon,  8 Mar 2021 15:02:37 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4DvM5T04YYz4ldL
 for <wireguard@lists.zx2c4.com>; Mon,  8 Mar 2021 15:02:37 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E8BE2BB08
 for <wireguard@lists.zx2c4.com>; Mon,  8 Mar 2021 15:02:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f172.google.com with SMTP id 130so9464060qkh.11
 for <wireguard@lists.zx2c4.com>; Mon, 08 Mar 2021 07:02:36 -0800 (PST)
X-Gm-Message-State: AOAM532L4TgsJSLPxZu6XQ1xkEb/m1eik3REdpKYvmrgzSfCQcn74Q7Z
 vHnPFx0MhYeE1IU1qLZ2WpIMtDBIoKeD7dKxIoc=
X-Google-Smtp-Source: ABdhPJyXWlWqslrYqWkdOK6AYMpkJUE+nrAh0nNwwdY7QYenhqapiW4jLLen5ny/iN8j9g924olR0E51cDh9r3gL2og=
X-Received: by 2002:a37:886:: with SMTP id 128mr21961661qki.430.1615215756448; 
 Mon, 08 Mar 2021 07:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20210306094705.1037746-1-kay.diam@gmail.com>
In-Reply-To: <20210306094705.1037746-1-kay.diam@gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Mon, 8 Mar 2021 09:02:20 -0600
X-Gmail-Original-Message-ID: <CACNAnaF8zOv0DPS7gSQTACcP9qUBa4PWV+bOeozOPZ1tDk2rvw@mail.gmail.com>
Message-ID: <CACNAnaF8zOv0DPS7gSQTACcP9qUBa4PWV+bOeozOPZ1tDk2rvw@mail.gmail.com>
Subject: Re: [PATCH] FreeBSD default tun name patch
To: kayrus <kay.diam@gmail.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 09 Mar 2021 00:17:31 +0000
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

On Sun, Mar 7, 2021 at 9:45 AM kayrus <kay.diam@gmail.com> wrote:
>
> This change allows to omit the tun interface name setting in FreeBSD. When name
> is not set, kernel automatically picks up the tun name and index.
> ---
>  tun/tun_freebsd.go | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>

Hi,

I'm a little confused by what's going on here -- folks are wanting to
use the assigned name from the tuntap cloner, or is it just a desire
to not require that a new name be specified? The latter seems
incompatible with how the Linux counterpart works, but perhaps Linux
doesn't assign a name/unit when opening /dev/net/tun like we do.

Thanks,

Kyle Evans


> diff --git a/tun/tun_freebsd.go b/tun/tun_freebsd.go
> index 12b44da..1883aad 100644
> --- a/tun/tun_freebsd.go
> +++ b/tun/tun_freebsd.go
> @@ -346,22 +346,24 @@ func CreateTUN(name string, mtu int) (Device, error) {
>                 return nil, fmt.Errorf("Unable to set nd6 flags for %s: %w", assignedName, errno)
>         }
>
> -       // Rename the interface
> -       var newnp [unix.IFNAMSIZ]byte
> -       copy(newnp[:], name)
> -       var ifr ifreq_ptr
> -       copy(ifr.Name[:], assignedName)
> -       ifr.Data = uintptr(unsafe.Pointer(&newnp[0]))
> -       _, _, errno = unix.Syscall(
> -               unix.SYS_IOCTL,
> -               uintptr(confd),
> -               uintptr(unix.SIOCSIFNAME),
> -               uintptr(unsafe.Pointer(&ifr)),
> -       )
> -       if errno != 0 {
> -               tunFile.Close()
> -               tunDestroy(assignedName)
> -               return nil, fmt.Errorf("Failed to rename %s to %s: %w", assignedName, name, errno)
> +       if name != "" {
> +               // Rename the interface
> +               var newnp [unix.IFNAMSIZ]byte
> +               copy(newnp[:], name)
> +               var ifr ifreq_ptr
> +               copy(ifr.Name[:], assignedName)
> +               ifr.Data = uintptr(unsafe.Pointer(&newnp[0]))
> +               _, _, errno = unix.Syscall(
> +                       unix.SYS_IOCTL,
> +                       uintptr(confd),
> +                       uintptr(unix.SIOCSIFNAME),
> +                       uintptr(unsafe.Pointer(&ifr)),
> +               )
> +               if errno != 0 {
> +                       tunFile.Close()
> +                       tunDestroy(assignedName)
> +                       return nil, fmt.Errorf("Failed to rename %s to %s: %w", assignedName, name, errno)
> +               }
>         }
>
>         return CreateTUNFromFile(tunFile, mtu)
> --
> 2.25.1
>
