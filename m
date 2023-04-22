Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC6EC6FD18
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Apr 2023 11:43:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 373f7526;
	Sat, 22 Apr 2023 11:43:43 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d0e33912
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Apr 2023 11:43:41 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5083bd8e226so3866780a12.3
 for <wireguard@lists.zx2c4.com>; Sat, 22 Apr 2023 04:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20221208.gappssmtp.com; s=20221208; t=1682163820; x=1684755820;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=v9Xxdj0gTyLtlm0w6PLVDkhFLCrCVXX2GlImXSJXKL4=;
 b=1l4MgaQZREVoryjFZZsdPjoc9vRew91BMcXRk1jJl9g5yHdNBnYUP0ymgonBHAZLlw
 mAN3JeQTC1kBFHOOZ7WVsTnCNLp9bvfVMrd5zFsSCkhbPzu+KKt352Ud9Rsp077XgapW
 H+lRtvCc8IAn8XI08u6A/DgxwBIAezpEc5jiUEdsc9fv+NnIvBWiytVixpzWayhWlRCD
 vr1hQ/Zb5YA1TH/QZGuoCGZ0FrfAprOiLWVMLc1RTYlZkgy6LQyqQnP7M/J3N5i1J7Z7
 ehqwVI7gDK780v5HIdcEFUKnWguwPZmIU8LhDDH4oN1PrD19oKayhi0Y3cW2kr2bt3RB
 akGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682163820; x=1684755820;
 h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
 :from:content-transfer-encoding:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v9Xxdj0gTyLtlm0w6PLVDkhFLCrCVXX2GlImXSJXKL4=;
 b=e1VlXknjnDu5RkC8ispBTGziaXTk8HxMjFOs4B5RsteUlI72HIozm+cS0VRmweFA5V
 Mwzzh5KdQRBk7nrfYjDmO1UH7QofidgMYkFQUcKlUxRblAsJz0fjO6Fsq7z+AhjBcJrL
 jh3KbqRynW0FEEHEPp72la1HjBQ205pzT+GJBvf8Zmk+NIrSiD5Ag7QVers9NNn2B7oO
 S3kk3Vn/UEF4KkLGkVFy4Hkx69Iki+TruXVcSdb4EDAo8+VIK+z+PmZxnc93g75YBw48
 M4URYioCYg0QrIDIrK5Mloi0RAv8sXZgUeTpKlu357NcQa5RL9e6scX6PUNBNK0eNSH4
 rsOw==
X-Gm-Message-State: AAQBX9ckOSBSWTEdFg3myN6VwiANeCPm2Xo5a9Pn7bm+tdwsCuS+fNto
 dxmKPC1Ae6H0KKWoDGPXqGOZgg==
X-Google-Smtp-Source: AKy350azwg+a7mMLJJo5fymdZyhWGG1pS7osiwE36/rsZND5qYbvFZdmEi8NiBvOgul+3fiSP0SBog==
X-Received: by 2002:aa7:ccc8:0:b0:504:ae78:89c5 with SMTP id
 y8-20020aa7ccc8000000b00504ae7889c5mr6938703edt.28.1682163820452; 
 Sat, 22 Apr 2023 04:43:40 -0700 (PDT)
Received: from smtpclient.apple (84-236-3-179.pool.digikabel.hu.
 [84.236.3.179]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05640206d400b00504b203c4f1sm2795044edy.40.2023.04.22.04.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 04:43:40 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Subject: Re: How to optimize AllowedIPs "overlapping" routes?
Date: Sat, 22 Apr 2023 13:43:28 +0200
Message-Id: <52C0BA1D-015E-4A46-A32E-7359A3304996@tomcsanyi.net>
References: <CAHx9mscq6+n6jPZMLk5jVza1UDVcoXHd3VEce2P+R79ywiyHUA@mail.gmail.com>
Cc: mailman-wireguard.com@johnnyutahh.com, wireguard@lists.zx2c4.com
In-Reply-To: <CAHx9mscq6+n6jPZMLk5jVza1UDVcoXHd3VEce2P+R79ywiyHUA@mail.gmail.com>
To: Omkhar Arasaratnam <omkhar@gmail.com>
X-Mailer: iPhone Mail (20E252)
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

The best way to deal with this IMHO in a multi platform way is adding weight=
 or metric to the specific routes, allowing them to be manually prioritized.=


Cheers,
Domi


> 22.04.2023 d=C3=A1tummal, 13:25 id=C5=91pontban Omkhar Arasaratnam <omkhar=
@gmail.com> =C3=ADrta:
>=20
> =EF=BB=BFRather than using the route setup logic in wg-quick, you could
> manually set the default gateway for (1) and add a more specific route
> for (2) in your route table. iirc (in Linux anyway...) the more
> specific route would take higher precedence.
>=20
> --oa
>=20
>=20
> --oa
>=20
>=20
>> On Sat, Apr 22, 2023 at 7:18=E2=80=AFAM Johnny Utahh
>> <mailman-wireguard.com@johnnyutahh.com> wrote:
>>=20
>> More discussion here:
>>=20
>> https://www.reddit.com/r/WireGuard/comments/12oimvq/how_to_optimize_allow=
edips_overlapping_routes/
>>=20
>> Clearly this is FAQ-ish kind of thing. It was a little hard for me to
>> easily find a reference for this kind of stuff. I realize the WireGuard
>> project may not consider it to be their responsibility to address such
>> things.
>>=20
>> ~J
>>=20
>>> On 2023-04-16 10:06 AM, Johnny Utahh wrote:
>>> 1. wg0.conf: AllowedIPs =3D 0.0.0.0/0, ::0/0 --> higher-latency network
>>> 2. wg1.conf: AllowedIPs =3D 192.168.7.0/24   --> much-lower-latency netw=
ork
>>>=20
>>> When enabling both of the devices/.conf's (listed as 1. and 2. above)
>>> concurrently, the #2 route travels over #1 (all starting up via
>>> 'wg-quick'). In this scenario I'd prefer #2 routing "bypasses" #1 and
>>> retain its (#2's) lower-latency path/network. Can this be done, somehow?=

>>>=20
>>> I deduce the "route" for #2 changes when concurrently-enabling #1
>>> because the #2-ping-latency immediately and dramatically increases to
>>> match #1-network's latency (and immediately reverts to #2's lower
>>> latency when #1 is disabled). This hurts my #2 network, badly.
>>>=20
>>> I'm running/testing the above on macOS v12.6.3 build 21G419,
>>> wireguard-go v0.0.20230223. If not on macOS, might this be feasible on
>>> Fedora or Ubuntu?
>>>=20
>>> I realize this might be a FAQ. I could not find any docs/resources to
>>> help after a brief search, so I'm posting here.
>>>=20
>>> [I'm not a networking expert, so I may be butchering various
>>> terminology, concepts. I apologize in advance for my ignorance.]
>>>=20
>>> ~J
