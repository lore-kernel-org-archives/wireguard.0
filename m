Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABEBC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 00:44:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55D62343B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 00:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55D62343B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a6fc86e;
	Fri, 8 Jan 2021 00:43:07 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c5b079d5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 00:43:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 22A275C0268;
 Thu,  7 Jan 2021 19:43:04 -0500 (EST)
Received: from imap7 ([10.202.2.57])
 by compute6.internal (MEProxy); Thu, 07 Jan 2021 19:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm1; bh=LZ0TFkaruBV0YROMH7NL4Wn9UT/i
 gRn9WCHGBshMWP8=; b=dlhe7hbn4UeRKGLDLAbm530rIDJBvFNf4D0nc6eIMCL2
 xB29R56dljwqH1xMcYZRhgee7IIHNEWfNz9FfeNc90ybjvl7b7/drcitRSB4MTXZ
 d8TcbQKofrNPVwan2cRtqKC1QkyfQw+rc/28e2LdvvWJZxvZnz+osqur/bG2mHbj
 1NNXkAu4v4t3dz+xJHVvDiPsOyYTv2DktHK1Q+hzcU6zjT5HLii9+1GLkhNkjreu
 xNADc32yZkdSEubi9XpKBYCf7Tu41rqXLWCdzYJN8sD+9nuaPg5/C4NFdWCu1N50
 1OwtGLfqJRMegwE+Q1tHs4GuKr4obefaqRjAzGOHJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LZ0TFk
 aruBV0YROMH7NL4Wn9UT/igRn9WCHGBshMWP8=; b=NLvCeueje0AJaEa+svhlcY
 90R2Y/tIqd8MifwfSgeFOu3MUINvWLTDUFeKhK8ZrIk4UI4gMJTDJ5kiQus24vZ5
 pRoRq/Mni9YlD9uhSn/Kb/Nhvmt9suaA7oOqwsO1ASkZu5qWidQPciAjyi4+AgnM
 +EBSxBi3G6T0gMBSWXnouDEW7l6/ZJeVUI7xA1lE4LjjuViLXvxK6NAaSce03jx4
 HJ09FhqmYF2JwuyvPl83uJ1VTvYPJ9PVeTH63NG1gVIRM4uJylWrWNxOAJGrpptD
 xzGOmPmCnJsiMd5n6TikUVzBzahz91LyexOdUQqqoooJFU3JvXQqgXRCThJTro5A
 ==
X-ME-Sender: <xms:l6r3XwCQjyjI0XaKp396Oii8LfjAidPSArs-MhBGag7sJDwbUaxL7g>
 <xme:l6r3XyhsdkiT5nAA396WkOU7hVmXv-TO6qIR9KZ7WaLqzK0B3uYebajCbhNHV5Rfv
 M7JM2KyAfxrjKwDhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfgrhhi
 tgcunfhighhhthdfuceovghrihgtsegvrhhitghlihhghhhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeelveefvefgheelieejudeutdefgeduieeuleetfeelveeuffehkeffffet
 gedugfenucffohhmrghinhepiiigvdgtgedrtghomhdpshgvnhhtvghntgdrvghspdgtuh
 gurghsvhgtrdgtohhmpdhshiiikhgrlhhlvghrrdgrphhpshhpohhtrdgtohhmpdhphhho
 rhhonhhigidrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegvrhhitgesvghrihgtlhhighhhthdrtghomh
X-ME-Proxy: <xmx:l6r3XzlV2JtF6vrBXa8Lmzf8PScIZp-2tE8DHoqAHDguSN6u_WamMg>
 <xmx:l6r3X2zrHPvpJRWNGyrgwvWnIV5WkGnN4V9nrRGCF4uZBVbb1RjMpQ>
 <xmx:l6r3X1QJp9KtrZKYz3IyNtl3esc7rEHu_5gnQw5dlrJqdiN3UgcAVw>
 <xmx:mKr3X3e_r3VbkDNxykCkNkxG_D-tAXCmwS1cYfRm5N-fX8GCDIN_MQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C3C7A1800A8; Thu,  7 Jan 2021 19:43:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <0029bece-0f7e-4467-948d-b48af50e5bca@www.fastmail.com>
In-Reply-To: <CA5B0431-801C-4F2E-85F5-E329F02D364A@morsecom.com>
References: <000000000000e13e2905b6e830bb@google.com>
 <CAHmME9qwbB7kbD=1sg_81=82vO07XMV7GyqBcCoC=zwM-v47HQ@mail.gmail.com>
 <CACT4Y+ac8oFk1Sink0a6VLUiCENTOXgzqmkuHgQLcS2HhJeq=g@mail.gmail.com>
 <CAHmME9q0HMz+nERjoT-TQ8_6bcAFUNVHDEeXQAennUrrifKESw@mail.gmail.com>
 <CACT4Y+bKvf5paRS4X1QrcKZWfvtUi6ShP4i3y5NukRpQj0p1+Q@mail.gmail.com>
 <CAHmME9oOeMLARNsxzW0dvNT7Qz-EieeBSJP6Me5BWvjheEVysw@mail.gmail.com>
 <CAH8yC8na1pNcGPBrfuBwyNbfC4JjOOo_xHODAkbjs1j-1h0+2A@mail.gmail.com>
 <CA5B0431-801C-4F2E-85F5-E329F02D364A@morsecom.com>
Date: Fri, 08 Jan 2021 13:42:43 +1300
From: "Eric Light" <eric@ericlight.com>
To: "Corey Costello" <ccostello@morsecom.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: UBSAN: object-size-mismatch in wg_xmit
Content-Type: text/plain
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

Corey - have you tried unsubscribing at the unsubscribe page?  https://lists.zx2c4.com/mailman/options/wireguard

Hope this helps,

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Fri, 8 Jan 2021, at 13:34, Corey Costello wrote:
> Get me off this fucking list ffs.
> 
> 
> 
> > On Jan 7, 2021, at 2:06 PM, Jeffrey Walton <noloader@gmail.com> wrote:
> > 
> > On Thu, Jan 7, 2021 at 2:03 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >> 
> >> On Thu, Jan 7, 2021 at 1:22 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> >>> 
> >>> On Mon, Dec 21, 2020 at 12:23 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >>>> 
> >>>> ...
> >>> 
> >>> These UBSAN checks were just enabled recently.
> >>> It's indeed super easy to trigger: 133083 VMs were crashed on this already:
> >>> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fsyzkaller.appspot.com%2fbug%3fextid%3d8f90d005ab2d22342b6d&c=E,1,RVpgZsRUCGs2jKlumiMAMnpeOF4QdiW5h8GDIsBJPz-orFNwvwCXnceC9n5Bhr1h-G2EsU0tlC7N4QUpHuF6tIMI7tTnBoRjAo5tT-Bk9-Fhe8CppuOL4mqdkA,,&typo=1
> >>> So it's one of the top crashers by now.
> >> 
> >> Ahh, makes sense. So it is easily reproducible after all.
> >> 
> >> You're still of the opinion that it's a false positive, right? I
> >> shouldn't spend more cycles on this?
> > 
> > You might consider making a test build with -fno-lto in case LTO is
> > mucking things up.
> > 
> > Google Posts Patches So The Linux Kernel Can Be LTO-Optimized By
> > Clang, https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fwww.phoronix.com%2fscan.php%3fpage%3dnews_item%26px%3dLinux-Kernel-Clang-LTO-Patches&c=E,1,7u3-jWadklYo8ai_XrPNvjnu46LLAyg0hqsGIaMPaoQ5UxtcNM84jrHUgSg4VciXKk9XVpwgyBwD85LbbW5_j195jSH6RrAej45I1kr_XfQ,&typo=1
> > 
> > Jeff
> 
>
