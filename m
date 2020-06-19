Return-Path: <SRS0=30W4=AA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21936C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jun 2020 07:38:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3F8320739
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Jun 2020 07:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rYSnfHKS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3F8320739
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 742f3a80;
	Fri, 19 Jun 2020 07:19:57 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e1bb8c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jun 2020 07:19:54 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8de61252
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jun 2020 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=1zHRgB4FA1kN
 uhqoXq/VpJrUHD4=; b=rYSnfHKSRhN0V12aGXwnJP97NLVO+y7Ojjcx2LxYIhKX
 xyHxEj7AuJF4OLryeRiXtqjuSFil31vNeN9GAMdCO6sJ0eS/Pxtyl1NUw4DEOOS4
 /q3jNvGl3wF9KWyU3rcwcwTvVepRjhModgtIDg6W7Y44H+K6ur/AMFkLSfjiAdiN
 yW3BNTvC8sy5ikin2gnCOkN8dEFRPsqY7qOo2mHEy7dB4SBSmfLeuVvz1dQQduYJ
 +zA+Kn9uG1wlCbzSBHJOcxw1z81TKYfg1lyLe0QkWu+gx2Ecs+j314Zk0iNn1YSv
 +MMEf3eqCIO46nwnXrPCTZdk25xsH7NH+NJ/9OhyBw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f8bd643
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jun 2020 07:19:54 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id b5so8420289iln.5
 for <wireguard@lists.zx2c4.com>; Fri, 19 Jun 2020 00:38:14 -0700 (PDT)
X-Gm-Message-State: AOAM530mYHTrQGZh1wRVmNyGWrgZuLrHDHeA6R3zaIo+ykxVRoJve3h2
 wqaAF/dfayhbgE5ZYHhjFGdCATxmd0oNOKQvjMI=
X-Google-Smtp-Source: ABdhPJyKNK4R5nWFp5i61O4doEwmxr/6DBZrUs9CEBIeDIMVKPpThR3hzkMIeH1CP0l7NfvX6W55kNldnWa+APiBkbs=
X-Received: by 2002:a92:2515:: with SMTP id l21mr2286764ill.64.1592552293416; 
 Fri, 19 Jun 2020 00:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
 <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
 <1e6ef75d-3657-888a-51dd-0bedf8783904@sysnux.pf>
 <CAHmME9q_eTwyLJ7z4RP4nJqEz9yu+9VH3oXm0j9Zx_Br3cFWEw@mail.gmail.com>
 <613e8bab-4062-3cec-15ab-eeca325a5859@sysnux.pf>
 <CAHmME9rvJmH=fvxvVYi5n3QHzt2tNskqoghjWG++bJSsv8iu7g@mail.gmail.com>
 <975a5f77-5c7e-dcfe-6bbe-d4b6e2c5e379@sysnux.pf>
In-Reply-To: <975a5f77-5c7e-dcfe-6bbe-d4b6e2c5e379@sysnux.pf>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Jun 2020 01:38:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9qy4j2XpsTu1syABo1g6BZyS4w3OYghmT4T2kj7WjTyyQ@mail.gmail.com>
Message-ID: <CAHmME9qy4j2XpsTu1syABo1g6BZyS4w3OYghmT4T2kj7WjTyyQ@mail.gmail.com>
Subject: Re: Kernel Panic after updating Kernel
To: Jean-Dens Girard <jd.girard@sysnux.pf>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jun 19, 2020 at 12:58 AM Jean-Dens Girard <jd.girard@sysnux.pf> wro=
te:
>
> Le 18/06/2020 =C3=A0 10:11, Jason A. Donenfeld a =C3=A9crit :
> > On Thu, Jun 18, 2020 at 2:10 PM Jean-Denis Girard <jd.girard@sysnux.pf>=
 wrote:
> >> I cannot reboot now, I will let you know how it goes later.
>
> Reboot with newer kernel and latest wireguard  still hangs.
>
> > Oh, in your case, you appear to be using the dkms package instead of
> > the elrepo package.
>
> Is that a problem?

Remove all wireguard packages. Update to the latest kernel. Run `find
/lib/modules -name '*wireguard*' -print -delete`. Then install
kmod-wireguard.

For further help, you're probably best off asking on IRC. From
debugging this with the original reporter there, this turned out to be
a mixing and matching of versions issue due to weird yum things.
