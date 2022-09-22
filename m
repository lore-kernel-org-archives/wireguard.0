Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B896C6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 09:55:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4e6b541f;
	Thu, 22 Sep 2022 09:47:13 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c06f131c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 09:47:11 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id m81so11670994oia.1
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=RkigYEs0ARZFlJuDIq/ySqclMy+E1vQnILW068yUsow=;
 b=QMNk7X3JZwWgCQcolXLmmyblSzuwuRJ/K7g+QH8nqZOof4AyGEIrJbeyyeUjTU794D
 pMMPR8KpFbPUAIXpIW6OQwovG3mWm0H6nYksJfD6DHbCrGur6awIKQAueyInPsdeByQJ
 TQkzHAGr+RTMcjQEU+UqSgEBMJI0z3WAW4YHTTaNUvZ4iceRxWGZr4GFrOJJs9J4YFWR
 yeBSio76ZF4TZ1u+IyjsMjMaxnjn1P38MPfrcar/8ep7tJ2DhMCNyjeTyaR3g4OSWCuh
 F1gwr7cg1n9nbvAfm3A8fll/TmCH0Xqg6JjdcdPJTR1RXbf9eDceNgsW3RnNfaVAuSYV
 Qdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=RkigYEs0ARZFlJuDIq/ySqclMy+E1vQnILW068yUsow=;
 b=Fm55PPC54TZDs+XeH4TYYuB6yQZMZNArGHhhB3fSvGpjxIKhsdqn6l5PGlZlbJvF5A
 y+R8KQUQsiJZV1zEiNW0aCTDD6itnOj/HGlNQ0h6riXSNwBVfZRqzV0q5nePVPa+a8YJ
 K31Ncw4P6l848Rbgl39BUFHVvbBcOXOBNYMNMbcBsMrBCmvOmHgJybXfyXSLxytAC85K
 /epS4SA8KulwZ8oxI1Ok+CEh9CASb1yBhF4FabL+q6DrCRQPFFSi3bKTiBFQxa5pHFTG
 +k9bzGecsMvwc6Bu8aFTK7hEXLOQkfAdsEKPOqMs8eqrh705CtP/F7mhxCPvx98dGu6f
 Pr6g==
X-Gm-Message-State: ACrzQf36Vqq7Swk8E91rdg4hggwDfgwdZHYwfBqE0N7itSmK97YvZ3am
 l5B20ZFTIqdWWQwYsTnTq9abPPYSeuCAkHyp0bbC4OXzsegxUw==
X-Google-Smtp-Source: AMsMyM4CO9lJA5kMz+KDdhZNlmRNuRuGNc1c+I9UFI1jcJruqgGnGQhO1uN/4hC2TT5oglIsehih3DvnOYIIKvbBXNQ=
X-Received: by 2002:a05:6808:1507:b0:350:7653:2351 with SMTP id
 u7-20020a056808150700b0035076532351mr1174563oiw.179.1663840030351; Thu, 22
 Sep 2022 02:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
 <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
 <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
 <6E42D7CE-E03C-4D87-B9CD-182567D9C087@mullvad.net>
In-Reply-To: <6E42D7CE-E03C-4D87-B9CD-182567D9C087@mullvad.net>
From: Houman <houmie@gmail.com>
Date: Thu, 22 Sep 2022 10:46:34 +0100
Message-ID: <CABBZOsk1BAVCSnYL=HXpnf6ncPJunmuumENQ76E+aV82HTaMuw@mail.gmail.com>
Subject: Re: Wireguard iOS crashes after upgrading to XCode 14
To: Andrej Mihajlov <and@mullvad.net>
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

Thank you Andrej for explaining the reason. It makes sense.

Kind regards,
Houman

On Thu, 22 Sept 2022 at 10:44, Andrej Mihajlov <and@mullvad.net> wrote:
>
> Hi Houman,
>
> I believe that the crash coming from withMemoryRebound is actually assertion (assert()). Very often assertions are stripped out from release builds, so I guess it could be the reason why it just worked in release builds.
>
> Jason has already replied in regards of releasing an update.
>
> Best regards,
> Andrej
>
> > On 22 Sep 2022, at 10:56, Houman <houmie@gmail.com> wrote:
> >
> > Hi Andrej,
> >
> > It works, well done!
> >
> > A strange thing though, before your patch I was still able to connect
> > to the VPN server, if I changed the schema to Release instead of
> > Debug.  Now with your patch it also works under Debug schema, which is
> > fantastic.
> > What could be the technical reason that it still worked under Release?
> >
> > And what will happen now, are you able to actually get this patch
> > released on the official repo? The repo hasn't been updated for a
> > year.  :-)
> >
> > Thanks,
> > Houman
> >
> >
> > On Thu, 22 Sept 2022 at 09:31, Andrej Mihajlov <and@mullvad.net> wrote:
> >>
> >> Hi,
> >>
> >> I think we have a bug. If I am right, basically in both IPv4 and IPv6 extensions, withMemoryRebound takes capacity which is actually a number of instances of a given type (sockaddr_ variant) and not the byte size of a struct.
> >>
> >> Could you please patch your WireGuardKit with the following commit and see if it helps?
> >>
> >> https://git.zx2c4.com/wireguard-apple/commit/?h=am/fix-addrinfo-crash
> >>
> >> Best regards,
> >> Andrey Mikhaylov
> >>
> >>> On 13 Sep 2022, at 14:41, Houman <houmie@gmail.com> wrote:
> >>>
> >>> My existing Wireguard iOS implementation stopped working after
> >>> upgrading to Xcode 14 today.
> >>> When trying to connect to servers that support only IPv4, then it's
> >>> fine. But if the server supports both IPv6 and IPv4 then the tunnel
> >>> crashes:
> >>>
> >>> This IPv6 extension in
> >>> wireguard-apple/Sources/WireGuardKit/IPAddress+AddrInfo.swift crashes
> >>> with a Fatal Error at addrInfo.ai_addr.withMemoryRebound()
> >>>
> >>> The whole extension below:
> >>>
> >>> extension IPv6Address {
> >>>   init?(addrInfo: addrinfo) {
> >>>       guard addrInfo.ai_family == AF_INET6 else { return nil }
> >>>
> >>>       let addressData = addrInfo.ai_addr.withMemoryRebound(to:
> >>> sockaddr_in6.self, capacity: MemoryLayout<sockaddr_in6>.size) { ptr ->
> >>> Data in
> >>>           return Data(bytes: &ptr.pointee.sin6_addr, count:
> >>> MemoryLayout<in6_addr>.size)
> >>>       }
> >>>       self.init(addressData)
> >>>   }
> >>> }
> >>>
> >>> Has anyone else experienced this problem?
> >>>
> >>> Thanks,
> >>
>
