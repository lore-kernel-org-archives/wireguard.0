Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C472C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 20:48:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0356D6113A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 20:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0356D6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=meshify.app
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 560fee5c;
	Thu, 9 Sep 2021 20:46:22 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 32e79d10
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 20:23:12 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id c19so2632075qte.7
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 13:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=meshify-app.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ip8XmsCH2ISigoOwdGPCt+ofqxUd7395svINv1bOIfE=;
 b=Zu7NwdEXTPHTitMzHUEos5pSPsfChsAQqHffdb4E93ZqmkgHFh29Zfhhrcqk6nPy8/
 Eq6g0IX3zArGm0zb6T+/83VIoRlJ/wasqRNmp5yOqroPdaE2SBQH/n5RfsGE9lZGekBm
 8M08ImaodjOk7gm89T4UPzEzAiLxj+gM7SSjBCwBK1fLI3vip1xciXpT46ka4dTqXw0K
 /HZz6YREGn1CAua6Mv99UZIK7hgBCdG7q/cjCAqc3rHwacC65HUW4m0333M2fo0hIwwX
 ljWqiuopiINY4TMREIFTI+tyu9qjcdSYhBFT3ArAaHUPSUZ75lpryu16vghxjBf2rajH
 BUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ip8XmsCH2ISigoOwdGPCt+ofqxUd7395svINv1bOIfE=;
 b=Ndiln/o1ycP7LPMcUBt+JTWF/lQqZhJzHNW800mta/nw6mn1KtJLQRKKObJHDfOfK8
 zIWKI/MjaVDkMnKG/0zcD4UFDGXwIgJNzmtxjgWrHze4qqm/Lyc3b3rs3IFLczmyvm9T
 jpcO3BpC7I+2mW2uvs1Hcx5T1k9cPEqNKBVSKaIlnY3SQqIvhLUdBt+S4/BFYbH4JtpR
 SWgSSmGAtLiFV3VyLiukHtKj74rq+5PXRgDPxQukjrx72w598crIafx9MKWWXDH3fctK
 8iqvDNGQ+uw/GbQLhITXM8nWOQPkffsAiCjIGnqgNs0vRuVL3ViUcONKRw39pIAWQvP2
 ZHng==
X-Gm-Message-State: AOAM531O3G578/Dmj8abGQlXnKlQgqLsCfPVirO1sgq1CU2fttFe/2WW
 A810WxAQfjlI64rz00rP8HwaIIK2LtxGbDUgWd0ViA==
X-Google-Smtp-Source: ABdhPJwC0euvE8KCQqfmiqYoYvigZrx58umsfoM4FkjiIiFQR197+NDqKRRtKdk+Q9lJs3gAJH8KawluOGj2lZsC1fQ=
X-Received: by 2002:ac8:60d9:: with SMTP id i25mr4618670qtm.406.1631218991514; 
 Thu, 09 Sep 2021 13:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <00042bf6-4e8c-8638-380d-6774b37f96c2@blackberry.com>
 <CAHmME9qXieNWU_Y5rz1eDM9Bh=YjBPaeQFTrsXr4PKHyh1ePRA@mail.gmail.com>
 <310f3386-a488-9e28-2f10-3f867ece0f53@blackberry.com>
In-Reply-To: <310f3386-a488-9e28-2f10-3f867ece0f53@blackberry.com>
From: Alan Graham <alan@meshify.app>
Date: Thu, 9 Sep 2021 13:23:00 -0700
Message-ID: <CAMeHLtxw939uNJcN=UZAR9wM10pB2xYOu2K_X++Z8LsfPCAmNw@mail.gmail.com>
Subject: Re: Wintun NeighborDiscoverySupported
To: Brad Spencer <bspencer@blackberry.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 09 Sep 2021 20:46:20 +0000
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

Hi Brad, Jason,

Adding the 0.0.0.0/0 (or ":::") to the config is what is causing some
growth of the arp table, but it is not growing indefinitely.  After
looking around for SupportsNeighborDiscovery and finding nothing, I
decided to check the repro.  When not routing all traffic through an
interface the arp cache is basically static:

PS C:\>  arp -a -N 100.0.0.2

Interface: 100.0.0.2 --- 0x38
  Internet Address      Physical Address      Type
  100.0.0.4                                   dynamic
  224.0.0.22                                  static
  224.0.0.251                                 static
  224.0.0.252                                 static
  239.255.255.250                             static

When routing all traffic through it grows more or less like an arp cache should:

PS C:\>  arp -a -N 100.0.0.2

Interface: 100.0.0.2 --- 0x38
  Internet Address      Physical Address      Type
  0.0.0.0                                     static
  8.8.4.4                                     dynamic
  8.8.8.8                                     dynamic
  13.64.180.106                               dynamic
  18.211.21.156                               dynamic
  20.98.103.204                               dynamic
  23.6.164.43                                 dynamic
  23.40.197.163                               dynamic
  23.204.103.147                              dynamic
  35.185.199.42                               dynamic
  40.83.247.108                               dynamic
  51.143.14.218                               dynamic
  54.214.97.217                               dynamic
  65.8.17.107                                 dynamic
  67.160.11.228                               dynamic
  69.1.20.242                                 dynamic
  73.118.184.4                                dynamic
  74.125.142.188                              dynamic
  74.125.197.188                              dynamic
  75.75.75.75                                 dynamic
  100.0.0.2                                   dynamic
  100.0.0.4                                   dynamic
  142.250.69.202                              dynamic
  142.250.217.99                              dynamic
  142.251.33.74                               dynamic
  142.251.33.106                              dynamic
  173.194.202.189                             dynamic
  192.168.200.2                               dynamic
  192.228.79.201                              dynamic
  224.0.0.22                                  static
  224.0.0.251                                 static
  224.0.0.252                                 static
  239.255.255.250                             static

So I tend to agree with Jason that this is "harmless" and shouldn't
cause any serious problems.  It would be nice for Microsoft to fix
Set-NetIPInterface, it looks like a bug that SupportsNeighborDiscovery
can't be set.

Best regards,
Alan Graham


On Thu, Sep 9, 2021 at 11:17 AM Brad Spencer <bspencer@blackberry.com> wrote:
>
> On 2021-09-09 2:42 p.m., Jason A. Donenfeld wrote:
> > So how exactly were
> > you "seeing" the ARP requests on the Wintun interface? Did wireshark
> > show it? Or did you read from the Wintun ring and actually see an ARP
> > frame? Or something else? Or was this just a manner of speaking and
> > you didn't actually observe ARP frames themselves?
> You're right to suspect that I was speaking imprecisely here.  We have
> never seen an ARP request appear on the Wintun interface!  I meant to
> say that we have noticed the ARP table for the Wintun interface
> accumulating entries.
>
> >> We _think_ that the NeighborDiscoverySupported property being Yes means
> >> that Windows issues ARP requests for addresses on the Wintun interface.
> > That seems like a good intuition. I'm wondering whether that's
> > something you're assuming or something you read on a Microsoft
> > website. I ask because this might provide a good entry point for
> > whatever reverse engineering I wind up doing to fix this.
> I pieced this together from a few scraps.
>
> On the MIB_IPINTERFACE_ROW page[1], the docs only tersely say:
>
> "A value that specifies if the IP interface support neighbor discovery."
>
> Microsoft seems to use the same terminology when documenting
> SetIpNetEntry2()[2]:
>
> "The SetIpNetEntry2 function sets the physical address of an existing
> neighbor IP address entry on the local computer."
>
> And then, most importantly, MIB_IPNET_ROW2, the structure used by that
> function says this in its Remarks section[3]:
>
> "For IPv4, this includes addresses determined used the Address
> Resolution Protocol (ARP). For IPv6, this includes addresses determined
> using the Neighbor Discovery (ND) protocol for IPv6 as specified in RFC
> 2461. "
>
> So, it seems that the "NetEntry" APIs are those that deal with ARP (and
> ND) entries, and the term Microsoft uses for that is "neighbor discovery".
>
> I don't know if the SupportsNeighborDiscovery field of MIB_INTERFACE_ROW
> is implied by other properties of the network interface (such as "all
> Ethernet interfaces support ARP") or whether it can be individually set
> at all.
>
> One other detail is that we have the gateway for the tunnel's routes set
> to 0.0.0.0 (or "::").  I presume that also influences how Windows
> decides which addresses might be on-link neighbours.
>
> 1.
> https://docs.microsoft.com/en-us/windows/win32/api/netioapi/ns-netioapi-mib_ipinterface_row
> 2.
> https://docs.microsoft.com/en-us/windows/win32/api/netioapi/nf-netioapi-setipnetentry2
> 3.
> https://docs.microsoft.com/en-us/windows/win32/api/netioapi/ns-netioapi-mib_ipnet_table2
>
> --
> Brad Spencer
>
