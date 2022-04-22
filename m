Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C3AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 22:25:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 04a79335;
	Fri, 22 Apr 2022 22:23:16 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5575d96b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 22:23:15 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id w16so2789875pfj.2
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JHEFbCSzTituLXCXTybtRDjC+y4H0lJbUwGY4K6dh4E=;
 b=JospNFsSTIe/Rnweo7xoBSMAwPsWRhI+HalpospItgXy7W/qZdF3kmQY1hbWUmC3w0
 fq4SvMARuC4IKQw+C1r1t+l5xrKV3UFnYLpdpCMB9XOEYRxOchbAjkh/OMxa+tLWXMh0
 SqApkjtdPHkNun3pqATVhKID/GJuDTkIGRUqyFK3qq3Ok03w07uBcQ82XkkyScmYCctC
 xGZDGvU3IT2WWjd10DQ0Z5fpCHak72FDL6PDx2W5pvLNO4YKduoX34KwWDreLBNgjScS
 0JBnYiCzEPoU+FGoFZzwFre2EVDC8v/VxBYCzPuEYpoHOtDXuT6oNIvQReaV0woyXJZF
 SPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JHEFbCSzTituLXCXTybtRDjC+y4H0lJbUwGY4K6dh4E=;
 b=yKguXF9VEn/HsUhhpO9n5DfTQT0KonQIwI1hDaikhYJVtlgmQtBvSgSF+eH4fDF0Wd
 yPAtmy5wZLc9ra43GWdnuiX2QLV2699R+rK4t5IuMD/VMCkHz5mBEdpbd5FYrGixHr/m
 Sh7El0LSI3CiFAREQ3xSFm4qEATXkXFzhv78Fiu2DUHxuE5lpUUiPN8+23MTKD+1a2ez
 tIQFZdSfJ46tCJAw/pW0fxYP+nFk9mNW1kWc0BAhNY8Lh/O+FhEbvEPV+7Vtw+5C2vxQ
 4nk9D0GvcYQHwG5qcaY/xIFiKhXTpRF+IXhug6/R8A2Bd/4Pg6Qadm6nwutAUQUCbjN1
 dC7g==
X-Gm-Message-State: AOAM532uaY4w5SjRu9W7QsAy+VtS05id3arIFoRtEI5bzL9siRHJwzYK
 NleimJ3d3grHgQpI/1uAFY0ticGUHdwEAABXBSw=
X-Google-Smtp-Source: ABdhPJyDQUVX549ZAM/GhSq5TvdRe+3wmbnPKS/TXPeMAAHJlEEBOkpcQqH3k9vfAcdEgLYcT0dXF4t1xGtEgApvjUE=
X-Received: by 2002:a05:6a00:22c8:b0:50a:dbf5:59cf with SMTP id
 f8-20020a056a0022c800b0050adbf559cfmr7056093pfj.74.1650666193435; Fri, 22 Apr
 2022 15:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220405212129.2270-1-cf.natali@gmail.com>
 <YmHwjdfZJJ2DeLTK@zx2c4.com>
In-Reply-To: <YmHwjdfZJJ2DeLTK@zx2c4.com>
From: =?UTF-8?Q?Charles=2DFran=C3=A7ois_Natali?= <cf.natali@gmail.com>
Date: Fri, 22 Apr 2022 23:23:01 +0100
Message-ID: <CAH_1eM2ECPKLcHAKQ-RNf4Zj5hrgT-aJ9pjTKfChf9fnZp5Vkw@mail.gmail.com>
Subject: Re: [PATCH] WireGuard: restrict packet handling to non-isolated CPUs.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Daniel Jordan <daniel.m.jordan@oracle.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>
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

Hi,

On Fri, 22 Apr 2022 at 01:02, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> netdev@ - Original thread is at
> https://lore.kernel.org/wireguard/20220405212129.2270-1-cf.natali@gmail.c=
om/
>
> Hi Charles-Fran=C3=A7ois,
>
> On Tue, Apr 05, 2022 at 10:21:29PM +0100, Charles-Francois Natali wrote:
> > WireGuard currently uses round-robin to dispatch the handling of
> > packets, handling them on all online CPUs, including isolated ones
> > (isolcpus).
> >
> > This is unfortunate because it causes significant latency on isolated
> > CPUs - see e.g. below over 240 usec:
> >
> > kworker/47:1-2373323 [047] 243644.756405: funcgraph_entry: |
> > process_one_work() { kworker/47:1-2373323 [047] 243644.756406:
> > funcgraph_entry: | wg_packet_decrypt_worker() { [...]
> > kworker/47:1-2373323 [047] 243644.756647: funcgraph_exit: 0.591 us | }
> > kworker/47:1-2373323 [047] 243644.756647: funcgraph_exit: ! 242.655 us
> > | }
> >
> > Instead, restrict to non-isolated CPUs.
>
> Huh, interesting... I haven't seen this feature before. What's the
> intended use case? To never run _anything_ on those cores except
> processes you choose? To run some things but not intensive things? Is it
> sort of a RT-lite?

Yes, the idea is to not run anything on those cores: no user tasks, no unbo=
und
workqueues, etc.
Typically one would also set IRQ affinity etc to avoid those cores, to avoi=
d
(soft)IRQS which cause significant latency as well.

This series by Frederic Weisbecker is a good introduction:
https://www.suse.com/c/cpu-isolation-introduction-part-1/

The idea is to achieve low latency and jitter.
With a reasonably tuned kernel one can reach around 10usec latency - howeve=
r
whenever we start using wireguard, we can see the bound workqueues used for
round-robin dispatch cause up to 1ms stalls, which is just not
acceptable for us.
Currently our only option is to either patch the wireguard code, or
stop using it,
which would be a shame :).

> I took a look in padata/pcrypt and it doesn't look like they're
> examining the housekeeping mask at all. Grepping for
> housekeeping_cpumask doesn't appear to show many results in things like
> workqueues, but rather in core scheduling stuff. So I'm not quite sure
> what to make of this patch.

Thanks, I didn't know about padata, but after skimming through the code it =
does
seem that it would suffer from the same issue.

> I suspect the thing to do might be to patch both wireguard and padata,
> and send a patch series to me, the padata people, and
> netdev@vger.kernel.org, and we can all hash this out together.

Sure, I'll try to have a look at the padata code and write something up.

> Regarding your patch, is there a way to make that a bit more succinct,
> without introducing all of those helper functions? It seems awfully
> verbose for something that seems like a matter of replacing the online
> mask with the housekeeping mask.

Indeed, I wasn't really happy about that.
The reason I've written those helper functions is that the housekeeping mas=
k
includes possible CPUs (cpu_possible_mask), so unfortunately it's not just =
a
matter of e.g. replacing cpu_online_mask with
housekeeping_cpumask(HK_FLAG_DOMAIN), we have to perform an AND
whenever we compute the weight, find the next CPU in the mask etc.

And I'd rather have the operations and mask in a single location instead of
scattered throughout the code, to make it easier to understand and maintain=
.

Happy to change to something more inline though, or open to suggestions.

Cheers,

Charles


>
> Jason
