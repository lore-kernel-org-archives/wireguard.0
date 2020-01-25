Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141D5C33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:08:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4322206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tRReQHTZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4322206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fb2ae69;
	Thu, 30 Jan 2020 01:54:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0aede031
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 16:04:10 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec7deed
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 16:04:10 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id w198so4056219qkb.3
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jan 2020 08:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=a/8Nc8db4UUjVfXWARwfSBHWtHZSXdd0bBjWlhGwHGo=;
 b=tRReQHTZ3M09AKJqNWi3tsrsH59ROPLU+PjXd3M05tvffRAVcHsYq9a3oh6S42eRlA
 XRUGBdOIJYCyzcZjvRJntj1iUSZbOJJ2iZu9S39bR/QcGBUQ02bOofd4RhA46cCz180r
 UgKJVLxHZ9r4tfHGwxeSa6shhoBPYiNxRx3eFiXL7yHZzd8HFFt4COrOCQIRwxP+HwOT
 6pIz8VXAXdhaksQ8VNJral97fYnR98AJ+oRbkvKMQKdXfdEccDEv6WKJw3fN7TSsFqbz
 EtiSm3C830WdP/uZUe4sb2IiIZumZekwFnJHZVNaKSJ4+yPNCNo0ys1lIIugiK7gzYyl
 mRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=a/8Nc8db4UUjVfXWARwfSBHWtHZSXdd0bBjWlhGwHGo=;
 b=KnS/cpCalJlsHe/sDsEb2fK0p7wefjWNP+dWNwzbYq/lkDaUMbNxtCTNvSahdMrDVf
 1FmvhECJlh+wOHoP1O60XUYQ9Malxx4aYBXPL1Ygl2fcOzxUNqQU8V84HcZ+2h2lWfgj
 6n0hQHHDA+WcelKminNgZ5zmTA/TO31tNh8u1cDRy3SHB+fRVbpReu2dDF7Anoh7lGR8
 EDNGxd/XGEAXxFn0DkJIrgL5ozvqBLgAYxcWhDef4AY8E6/mxtAvJrYvjNv4cQVSjJox
 eEuAhOdPe/MgweJR7oCjrxa1H+jbmlKREBw96U34eal55UbdDcl7Si919uDEY7NaVB1n
 T1ug==
X-Gm-Message-State: APjAAAUE7lANo5KeEgaN0JFwtByF2z7XDwxbOS1Jb1ZnelWe446cVvE4
 k+TV5JdXjAmQdqOz28YSjIKb99X508IcKPUaaO4PcGqEX2LLJw==
X-Google-Smtp-Source: APXvYqyFCtw/tj+1Eb6+sW0utCP/t762QvyJAAFWJ4Ti4AqgwCeGDq0IfNKnTBqYvwsfQTZY98gWlv4KfSf3oVbxEm8=
X-Received: by 2002:a37:4c05:: with SMTP id z5mr7997023qka.469.1579968249737; 
 Sat, 25 Jan 2020 08:04:09 -0800 (PST)
MIME-Version: 1.0
References: <9420fa01-61b9-73cb-21f4-681bf8015b7b@orlandi.com>
 <ea889cc3-9599-4218-a8cc-6daa9d2965e2@www.fastmail.com>
 <38df62df-2c77-48b1-f020-48a410ff381e@orlandi.com>
In-Reply-To: <38df62df-2c77-48b1-f020-48a410ff381e@orlandi.com>
From: "b13253@gmail.com" <b13253@gmail.com>
Date: Sun, 26 Jan 2020 00:03:33 +0800
Message-ID: <CA+7UkwKDJdPvWSNA1ECAPUBYh2oDxsyDC9twkFSph2mA-=a1TQ@mail.gmail.com>
Subject: Re: Tunnel traffic in VRF
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:54:05 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sat, Jan 25, 2020 at 10:10 PM Daniele Orlandi <daniele@orlandi.com> wrote:
>
> On 25/01/2020 07:55, Steven Honson wrote:
> > Hi Daniele,
> >
> > By VRFs, do you mean Linux network namespaces, or something different?
>
> They are a different feature. In short VRFs are separate routing tables
> to provide routing isolation. They are somewhat different with respect
> to namespaces as the isolation is visible to userspace.

Hi Daniele,

VRF is different from network namespaces.

I have collected some materials about the VRF implementation of Linux:
- https://schd.ws/hosted_files/ossna2017/fe/vrf-tutorial-oss.pdf
(Slides introducing VRF)
- https://cumulusnetworks.com/blog/vrf-for-linux/ (Article describing
the differences among VRF, ip rule, and namespace)
Hope they help.

Best regards,
StarBrilliant
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
