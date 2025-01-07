Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDB8C3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 21:22:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6cd75f1;
	Tue, 20 May 2025 19:38:22 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ffb5a93
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Jan 2025 12:53:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so7381150f8f.0
 for <wireguard@lists.zx2c4.com>; Tue, 07 Jan 2025 04:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736254437; x=1736859237; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F66Eu0GAg36EcgkwSAQsoLttohjhJJSzBhrgfuDrfa8=;
 b=aQBXEeOQnVThuP3cnTebMNhiryywDO9ORQFmu3hFk9izrAiKMVlPkuMbyBtSre9mvd
 Q28tVlVMmwUt6wpf2yFvsF9iouUB7UYS+UG1eTeUAt/fyjNvixcdks6V4E1NDRyaifhS
 FuZaxJe6T/GKCjvqHG0rM4cXbDr8DOEVzvOSuCVOkhCWPnxTvz3RvbJsz4KzvG6G6wpc
 Hk/H4+bH8PV5TkjOTNVMBGyVfQAFdgHQajm5lcY6oOe5f/2XDXCKDGCP2iMSbvjUzpb/
 DHIZPmsvx07IX+8DVLDhdM7giyARiJ8RMD6X5dmKBmhQRlgZyxV1ibPbsJoI04ZUwv7o
 rdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736254437; x=1736859237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F66Eu0GAg36EcgkwSAQsoLttohjhJJSzBhrgfuDrfa8=;
 b=Mcw8DaD7lZ/N1WQBFBokh9D6KD9Du8qDWCMPlUUk/PqIgHtFTrENQwvukbCEp6hmcg
 PLLidrdW05Gfiw0gdZjifz5rbD1eMWe0wJBuW4S87jcLIJtuQ8DxWDFW9LXa62DX8rQP
 2jnZ7VjtX6TUVFj2nzIAs+IR0oFaLVPbkHVojKr02nUWTMtq7Jsa3rfk+jlrXggZvXcj
 /czrZTuQOiEm0ain5aZGNmBPcN0O6bOOvIay4p6fDAR6Al9WqJjNAo6wp5wmyKtT6eXE
 rzdLroYXIQJXeuWI0sgUt6S4pjHscBiT4PoZQf/7WokntYnY6bHCP2mu1GAoSr+UpqLu
 UcKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNHMnKFksiCChcOk4jvAE+plALy8XalHagFEetiQ9r2LSqJ4Y9Bf1T7hUxfBxgz7txSBCh2Ly1A7g=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwnwBlXO/i1hI/EDZrnKjf87ecNZktQcblb6Hmoy4I7R19cpUjU
 pogcEaaWcaMmXPKRDUXgW19XsP1NqVKJrVLng2xS3IKnxW/XeNzGjZw4TXv63fbL0p1jc+VYLcf
 W9uMgURO4rM4RYw9z89TeBZjOPGI=
X-Gm-Gg: ASbGncskueiC0a/1PUh6fXDDV4lv5TOOuDU3SdEdC581D0AYIZwDZQ8rtRUTLR5xLHE
 VU495dDS8U123FC1rgrraTWfE3e1TuhnsIpI8
X-Google-Smtp-Source: AGHT+IHLmQYT6Nfe/TxqetejkNmjRWULhNkXti9Y+FoSO0oNz6JKWmwppacRVdUE20hj8uvdZwuWTQu822tlGBPGUFc=
X-Received: by 2002:adf:a15d:0:b0:38a:615c:8222 with SMTP id
 ffacd0b85a97d-38a615c828emr14509037f8f.4.1736254436561; Tue, 07 Jan 2025
 04:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20250104125732.17335-1-shaw.leon@gmail.com>
 <20250107085646.42302-1-kuniyu@amazon.com>
In-Reply-To: <20250107085646.42302-1-kuniyu@amazon.com>
From: Xiao Liang <shaw.leon@gmail.com>
Date: Tue, 7 Jan 2025 20:53:19 +0800
Message-ID: <CABAhCOQdBL6h9M2C+kd+bGivRJ9Q72JUxW+-gur0nub_=PmFPA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 00/11] net: Improve netns handling in rtnetlink
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: andrew+netdev@lunn.ch, b.a.t.m.a.n@lists.open-mesh.org, 
 bpf@vger.kernel.org, bridge@lists.linux.dev, davem@davemloft.net, 
 donald.hunter@gmail.com, dsahern@kernel.org, edumazet@google.com, 
 horms@kernel.org, idosch@nvidia.com, jiri@resnulli.us, kuba@kernel.org, 
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-wpan@vger.kernel.org, liuhangbin@gmail.com, netdev@vger.kernel.org, 
 osmocom-net-gprs@lists.osmocom.org, pabeni@redhat.com, shuah@kernel.org, 
 wireguard@lists.zx2c4.com
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

On Tue, Jan 7, 2025 at 4:57=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.com=
> wrote:
[...]
>
> We can fix this by linking the dev to the socket's netns and
> clean them up in __net_exit hook as done in bareudp and geneve.
>
> ---8<---
> diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
> index 89a996ad8cd0..77638a815873 100644
> --- a/drivers/net/gtp.c
> +++ b/drivers/net/gtp.c
> @@ -70,6 +70,7 @@ struct pdp_ctx {
>  /* One instance of the GTP device. */
>  struct gtp_dev {
>         struct list_head        list;
> +       struct list_head        sock_list;
>
>         struct sock             *sk0;
>         struct sock             *sk1u;
> @@ -102,6 +103,7 @@ static unsigned int gtp_net_id __read_mostly;
>
>  struct gtp_net {
>         struct list_head gtp_dev_list;
> +       struct list_head gtp_sock_list;

After a closer look at the GTP driver, I'm confused about
the gtp_dev_list here. GTP device is linked to this list at
creation time, but netns can be changed afterwards.
The list is used in gtp_net_exit_batch_rtnl(), but to my
understanding net devices can already be deleted in
default_device_exit_batch() by default.
And I wonder if the use in gtp_genl_dump_pdp() can be
replaced by something like for_each_netdev_rcu().


>  };
>
>  static u32 gtp_h_initval;
> @@ -1526,6 +1528,10 @@ static int gtp_newlink(struct net *src_net, struct=
 net_device *dev,
>
>         gn =3D net_generic(dev_net(dev), gtp_net_id);
>         list_add_rcu(&gtp->list, &gn->gtp_dev_list);
> +
> +       gn =3D net_generic(src_net, gtp_net_id);
> +       list_add(&gtp->sock_list, &gn->gtp_sock_list);
> +
>         dev->priv_destructor =3D gtp_destructor;
>
>         netdev_dbg(dev, "registered new GTP interface\n");
> @@ -1552,6 +1558,7 @@ static void gtp_dellink(struct net_device *dev, str=
uct list_head *head)
>                         pdp_context_delete(pctx);
>
>         list_del_rcu(&gtp->list);
> +       list_del(&gtp->sock_list);
>         unregister_netdevice_queue(dev, head);
>  }
>
> @@ -2465,6 +2472,8 @@ static int __net_init gtp_net_init(struct net *net)
>         struct gtp_net *gn =3D net_generic(net, gtp_net_id);
>
>         INIT_LIST_HEAD(&gn->gtp_dev_list);
> +       INIT_LIST_HEAD(&gn->gtp_sock_list);
> +
>         return 0;
>  }
>
> @@ -2475,9 +2484,12 @@ static void __net_exit gtp_net_exit_batch_rtnl(str=
uct list_head *net_list,
>
>         list_for_each_entry(net, net_list, exit_list) {
>                 struct gtp_net *gn =3D net_generic(net, gtp_net_id);
> -               struct gtp_dev *gtp;
> +               struct gtp_dev *gtp, *next;
> +
> +               list_for_each_entry_safe(gtp, next, &gn->gtp_dev_list, li=
st)
> +                       gtp_dellink(gtp->dev, dev_to_kill);
>
> -               list_for_each_entry(gtp, &gn->gtp_dev_list, list)
> +               list_for_each_entry_safe(gtp, next, &gn->gtp_sock_list, s=
ock_list)
>                         gtp_dellink(gtp->dev, dev_to_kill);
>         }
>  }
> ---8<---
