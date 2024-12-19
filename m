Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27893C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 17:06:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e37a7bf7;
	Tue, 20 May 2025 19:36:20 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a9807ddc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Dec 2024 05:54:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361d5dcf5bso4289265e9.3
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 21:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734587681; x=1735192481; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfCpfOoSh8ogvEFAzzK5Sh/fDzaPC/IoHjTWRLgy2Xc=;
 b=gu8XKh///IE1peAjIj6C/iwUKxddLbPeKiFOtIgoQPQs0slXpdkGryXk3rePVsg5Uy
 OuAtBKmE33dYaZiXpa1zczptslnVt7mPc9pbsBOW9SwGIuOZdJ+Ry3PeVqyKo40P77wS
 +ucA6s0x8EfHbBiYv6Shv+I77LBb8Q6z1TqOHxFOq3kwaMPDPjUGIC93zyCXBgVZY7XL
 oY2JYs6vOKfEfswAwRgcnowt4rfPWlkFR5v2mHlK7jSm2GDJBFxcQDkorzwWts/kcS2T
 Db4p8VGslkKkkbcRWvFZOJK6OxqxnGa+l0DmfTHFYE7EstzkRb5BpvrdDLzbc324o8rT
 sk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734587681; x=1735192481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfCpfOoSh8ogvEFAzzK5Sh/fDzaPC/IoHjTWRLgy2Xc=;
 b=RSZawuDDmy1OwSlWldqNziO7yYp+x4mTnEdoBMxul5RLeRuniQXVMo/MLVGmkeO4d6
 hqwfYfySyWlRMhkOF3M52zhVhV3MVsfYXPw5AZ3OZ7ZxjM/LJliqTarQbzUXA0yYQE2p
 LLrPkAVD3cuebElMmKaITIfDv74imVWRim5CGQsu4ct+EXT+xKMlqTnWy3xu4XddLm5k
 LntxqYq7dkB0B+gA/jarB+pbH/CA43Tyb6H7Dw29G4Z8yCa5IRi4EwDxY0/CLE6iat2G
 2tcRKScC8gjq/wcfwqTULFg5m6uR+BbEx6DW2/FBUIZDHCSVFA3S7ui5S158vFOfL1gV
 9rQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbb1OG9jp3ZRHfXAnDMa7UndP2OBfOPiYFyP7THWirDtZOE4oLuUSPlchNhdtYwyd0G5/c9d6w5rw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyakRDRS/EAy6Zvgf71HeZ1xoW+CLgewU2cAZlk4+Gkg1iuvir2
 gfQjaiGcvPaeKs2IQA4DsGQ3kz31EilPgGfFsSkdcRRrTP320PbKngGoAmNAF35zoWbDjvntlyB
 zF1gW5KX1B36+dJaswey4rylSHzE=
X-Gm-Gg: ASbGncuL7t6UUifuSuOus1PSdbiOllPIVdTNX+d6cdch0ZtIaP4L541AO6gRUqrOBEo
 8uU2u/uKM4wG6Y0WO2u7y3CTj4EQ49yW9K6v9
X-Google-Smtp-Source: AGHT+IFXswhNY3wf74HiVRQ6mWtI+LQ0dYPzH2WDbrTkg0k3vCjw9PHsmFSj9uux2yKPzKWzDIYRJF3gX8R2i5iXHRM=
X-Received: by 2002:a05:600c:4ed2:b0:434:f7ea:fb44 with SMTP id
 5b1f17b1804b1-4365535c6a3mr52447275e9.14.1734587681279; Wed, 18 Dec 2024
 21:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20241218130909.2173-1-shaw.leon@gmail.com>
 <20241218130909.2173-12-shaw.leon@gmail.com>
 <20241218153759.672b7014@kernel.org>
In-Reply-To: <20241218153759.672b7014@kernel.org>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Thu, 19 Dec 2024 13:54:03 +0800
Message-ID: <CABAhCORszq9ao3OCVW-1EBsxsnLxbQ096eV+cbs12Es2HvCgUA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 11/11] selftests: net: Add test cases for link
 and peer netns
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Kuniyuki Iwashima <kuniyu@amazon.com>, Donald Hunter <donald.hunter@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, 
 Hangbin Liu <liuhangbin@gmail.com>, linux-rdma@vger.kernel.org, 
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org, 
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com, 
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org, 
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Dec 19, 2024 at 7:38=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 18 Dec 2024 21:09:09 +0800 Xiao Liang wrote:
> >  - Add test for creating link in another netns when a link of the same
> >    name and ifindex exists in current netns.
> >  - Add test to verify that link is created in target netns directly -
> >    no link new/del events should be generated in link netns or current
> >    netns.
> >  - Add test cases to verify that link-netns is set as expected for
> >    various drivers and combination of namespace-related parameters.
>
> Nice work!
>
> You need to make sure all the drivers the test is using are enabled by
> the selftest kernel config: tools/testing/selftests/net/config
>
> This may be helpful:
> https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-=
style#how-to-build

Thanks for pointing it out. And vng is really cool. I will add
the missing config in the next version.

> --
> pw-bot: cr
