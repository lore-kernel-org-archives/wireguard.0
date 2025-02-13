Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965DBC54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa2e452d;
	Tue, 20 May 2025 19:40:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c3348bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Feb 2025 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739438278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyhNP3qOlJ39umXMZfckH2nuz/m9WI3f5NG3i+yZUF4=;
 b=PDS3twiUXT7kG3kZRHfQHEf3ZlRWS5CRBFp/KaL629RmVEHFAOi39oMMqTAXw00+/87XkL
 jqd9hb7qGOVUwxhGwFxixjlfibJUbSlaRwFnzlHrHFvDAOXYtlqsyVj5J0uKHYdd9KF4Yy
 6mOD3XvdCz9ORg3DRanl1O0iTpAVirs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-eQFzfZQFMIKgcEliFoFp4w-1; Thu, 13 Feb 2025 04:17:56 -0500
X-MC-Unique: eQFzfZQFMIKgcEliFoFp4w-1
X-Mimecast-MFC-AGG-ID: eQFzfZQFMIKgcEliFoFp4w
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38dfede57feso274807f8f.2
 for <wireguard@lists.zx2c4.com>; Thu, 13 Feb 2025 01:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739438275; x=1740043075;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gyhNP3qOlJ39umXMZfckH2nuz/m9WI3f5NG3i+yZUF4=;
 b=GQfqhlGKozDFnwoix3tyq+azxN2TR+sUevjgRx3L4b8dG13q//lKTPYwM+YN2rWTCT
 ByDwYFisGv0SUm0EHP+2mhCblcTeZbdetIEVT1F+2HLdPJsRVjbIpZVqV/B4jEe8ZWX4
 81HByOuJVyMuU3o7eWr/BaW4MGeOAeJ/TX2Wb2lnGKzjmbdQmZvioRL/YMoDnqxrplIP
 Y8WE5AHS66g2eo/1uLDXoeeCFCURaI8CLdebUYWnT4WRMNvL3xejOuxHOvXnmWvZ+rYo
 ZTDMvUc+Nxb3Kqtz1+dxQODi3swwTGnyv7RCNxgGlpTN3jJvSMWfNePop5NHdrZTuMyB
 Tnvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn8PAB99Q0dHGMQq/16bGMyOiMwLiKfzVXzeBkOTYlDHNZLZNCn63f0ZvlrjgNAJXWUlc4IXuqXyY=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Ywa/9x4wDq21i2m/pyB2arjwW2qBQM/MnRAE0TX7LS2ZW8htdSo
 2KCYXA71G1pWl0dGtexUj0YSbClIaCqPT16px8kgXqw4JFp+zIVO6i8qCTYPoBu1QEnDTGZR8hI
 Louf0/emQxO+pPNOdOZcMQF45Ju6QbO0Sj+2TEhibe5dqtexfSj05dAZM3w==
X-Gm-Gg: ASbGnctNaepd/IZ2g6NRPPfraVXgtRyoGWYpQfM6CAWUsgWYo6A/rSLFCVh/SIciz+/
 3ZbhXYfonPE/lFJJmaXv5t4G8UWF4H72Rgsl+zrL55LenFHGdDR9caF6o0PtHHPjA/zsg+u+mV6
 fXjHnlwRaneATIrDa9F/rWAMSCiNMeaMyE3UXMCaJZ94PYwNSOPMp2zkHhd1bftIY/TPEJ/Fabi
 4KEJMvckkLOqT/VfC9xJ2XoH12C5SLYDY0IDnaxHnwNHGE6+Zsbe5F/C7vWbNBls6+z5CiFNd74
 2OAEt0I8JnJ9d3kGJpp1HJqAtrHxPbFJJY4=
X-Received: by 2002:a5d:59ad:0:b0:38d:d9bd:18a6 with SMTP id
 ffacd0b85a97d-38dea2e8252mr5537712f8f.42.1739438275359; 
 Thu, 13 Feb 2025 01:17:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvdEpVIGWCwTdkiFI9VeLvCiv6OrrtGDZTcFYpY+kBOdDZTqd8HRvUuOkaOwq9itdXLKF4sg==
X-Received: by 2002:a5d:59ad:0:b0:38d:d9bd:18a6 with SMTP id
 ffacd0b85a97d-38dea2e8252mr5537666f8f.42.1739438274976; 
 Thu, 13 Feb 2025 01:17:54 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258cccdesm1314704f8f.26.2025.02.13.01.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 01:17:54 -0800 (PST)
Message-ID: <2c294c0a-26c4-4ec5-992d-a2fd98829b16@redhat.com>
Date: Thu, 13 Feb 2025 10:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 02/11] rtnetlink: Pack newlink() params into
 struct
To: Xiao Liang <shaw.leon@gmail.com>, Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: alex.aring@gmail.com, andrew+netdev@lunn.ch,
 b.a.t.m.a.n@lists.open-mesh.org, bpf@vger.kernel.org,
 bridge@lists.linux.dev, davem@davemloft.net, donald.hunter@gmail.com,
 dsahern@kernel.org, edumazet@google.com, herbert@gondor.apana.org.au,
 horms@kernel.org, kuba@kernel.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-ppp@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-wpan@vger.kernel.org,
 miquel.raynal@bootlin.com, netdev@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, shuah@kernel.org,
 stefan@datenfreihafen.org, steffen.klassert@secunet.com,
 wireguard@lists.zx2c4.com
References: <20250210133002.883422-3-shaw.leon@gmail.com>
 <20250213065348.8507-1-kuniyu@amazon.com>
 <CABAhCOTw+CpiwwRGNtDS3gntTQe7XESNzzi6RXd9ju1xO_a5Hw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CABAhCOTw+CpiwwRGNtDS3gntTQe7XESNzzi6RXd9ju1xO_a5Hw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wBlESGNzrhaPD_CjBGY0K2G673rxWsQadMlHbx9TOwc_1739438275
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 2/13/25 9:36 AM, Xiao Liang wrote:
> On Thu, Feb 13, 2025 at 2:54 PM Kuniyuki Iwashima <kuniyu@amazon.com> wrote:
> [...]
>>> diff --git a/include/linux/if_macvlan.h b/include/linux/if_macvlan.h
>>> index 523025106a64..0f7281e3e448 100644
>>> --- a/include/linux/if_macvlan.h
>>> +++ b/include/linux/if_macvlan.h
>>> @@ -59,8 +59,10 @@ static inline void macvlan_count_rx(const struct macvlan_dev *vlan,
>>>
>>>  extern void macvlan_common_setup(struct net_device *dev);
>>>
>>> -extern int macvlan_common_newlink(struct net *src_net, struct net_device *dev,
>>> -                               struct nlattr *tb[], struct nlattr *data[],
>>> +struct rtnl_newlink_params;
>>
>> You can just include <net/rtnetlink.h> and remove it from .c
>> files, then this forward declaration will be unnecessary.
> 
> OK. Was not sure if it's desirable to include include/net files from
> include/linux.

I think we are better of with the forward declaration instead of adding
more intra header dependencies, which will slow down the build and will
produces artifacts in the CI runs (increases of reported warning in the
incremental build, as any warns from the included header will be
'propagated' to more files).

>>> +extern int macvlan_common_newlink(struct net_device *dev,
>>> +                               struct rtnl_newlink_params *params,
>>>                                 struct netlink_ext_ack *extack);
>>>
>>>  extern void macvlan_dellink(struct net_device *dev, struct list_head *head);
>>
>>
>> [...]
>>> diff --git a/include/net/rtnetlink.h b/include/net/rtnetlink.h
>>> index bc0069a8b6ea..00c086ca0c11 100644
>>> --- a/include/net/rtnetlink.h
>>> +++ b/include/net/rtnetlink.h
>>> @@ -69,6 +69,42 @@ static inline int rtnl_msg_family(const struct nlmsghdr *nlh)
>>>               return AF_UNSPEC;
>>>  }
>>>
>>> +/**
>>> + *   struct rtnl_newlink_params - parameters of rtnl_link_ops::newlink()
>>
>> The '\t' after '*' should be single '\s'.
>>
>> Same for lines below.
> 
> This is copied from other structs in the same file. Should I change it?

https://elixir.bootlin.com/linux/v6.13.2/source/Documentation/process/maintainer-netdev.rst#L376

In this series, just use the good formatting for the new code.

Thanks,

Paolo

