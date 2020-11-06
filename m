Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB8BC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:02:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95CF92067C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL1dCFOz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95CF92067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81ccef0c;
	Mon, 9 Nov 2020 22:40:34 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [2a00:1450:4864:20::642])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74a0cf46
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Nov 2020 08:24:43 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id w13so708882eju.13
 for <wireguard@lists.zx2c4.com>; Fri, 06 Nov 2020 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dxxdg5vykW5t09YvbbZDwBqARbOva9lwcwb08iLB/24=;
 b=KL1dCFOzK5EkGlCiUJnvY/OmmVeFNBiDP7tzgPW/LZ3z+wUJY2h074oY28KKJk9G8O
 LvLkrB/Y7ey5xNEaI+H/n05rdS4HohO+wxxFY5RQJQR+XCPlUCtGKq0sAulgj6oFi1qN
 3W3tJBIie9jBB3xUvgfjY3/ykwtQZcnXN8kd+pSG2047sR4E96znrx9oJLnrUX+Ht8Nm
 T+KC+xNDPC4lHwBFWGQZTUoTGmAZCWQUYyGB5+C0ccEcgedgf+NDrfETmXIFUD9zBjxE
 noSREBDBVHEI5IIxkR8/IVALmcJpk1AbgvnKS8mLw650bP3bEk44RyYRUuqh/Yxm15Nz
 jUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dxxdg5vykW5t09YvbbZDwBqARbOva9lwcwb08iLB/24=;
 b=pKCZeWoK8H7ZGDGxAGU3Q9eulbiyS7bMwswxYLy3/Q9mwMU4Hdtdkl4jQd90aUWSVI
 cBpHQDC4yqLMLoYIZtTAMWunWROiSSwFOiHb39aRFgTcbBVfCUcuMQD0HSQARyhoo49e
 n5i6zJyvVMOnco0uyXTc12QaJjR2PGJktPQOvQZowD0pPu97QhnIYAxdWi5PdXwS/xCu
 E8RIXvOEk0F2Oo813CdD8MoZwLvEk6Lk9eBV3eHmu7DODWIFgSZXR1aikUj92sjXXFCp
 cYL9bTqrUdr2m+R4kzTLq/vJ6syW2netQWcuPPGgLg4l0RkU+V/G/l+ik0S37lrJEMOl
 xb5g==
X-Gm-Message-State: AOAM53073LmY+jo3gItSNWwJo/7Kc31Poh50MAEjlGdyFpCGTNay187/
 ErlO+yeoL7JucOg8ZH8Mc/k=
X-Google-Smtp-Source: ABdhPJyA57t3TXgYGGKSt0xMLLx0kO1yOoiQcMXncLpqzjt1ZvxZolqzWQ96PQ5gIMyJg0GVjqp+IQ==
X-Received: by 2002:a17:906:1989:: with SMTP id g9mr918597ejd.62.1604651272250; 
 Fri, 06 Nov 2020 00:27:52 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:8d7e:efd:393d:7a36?
 (p200300ea8f2328008d7e0efd393d7a36.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:8d7e:efd:393d:7a36])
 by smtp.googlemail.com with ESMTPSA id o20sm383127eja.34.2020.11.06.00.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2020 00:27:51 -0800 (PST)
Subject: Re: [PATCH net-next v2 03/10] tun: switch to net core provided
 statistics counters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>
Cc: David Miller <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Harald Welte
 <laforge@gnumonks.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 osmocom-net-gprs@lists.osmocom.org, wireguard@lists.zx2c4.com,
 Steffen Klassert <steffen.klassert@secunet.com>
References: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
 <30fd49be-f467-95f5-9586-fec9fbde8e48@gmail.com>
 <20201105171446.5f78f1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <dcb51de1-5e11-7c07-9784-bf3546a1246a@gmail.com>
Message-ID: <aea7d78e-2d77-1f8a-70f0-73d46c96b44e@gmail.com>
Date: Fri, 6 Nov 2020 09:27:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dcb51de1-5e11-7c07-9784-bf3546a1246a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:12 +0100
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

On 06.11.2020 08:48, Heiner Kallweit wrote:
> On 06.11.2020 02:14, Jakub Kicinski wrote:
>> On Wed, 4 Nov 2020 15:25:24 +0100 Heiner Kallweit wrote:
>>> @@ -1066,7 +1054,7 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
>>>  	return NETDEV_TX_OK;
>>>  
>>>  drop:
>>> -	this_cpu_inc(tun->pcpu_stats->tx_dropped);
>>> +	dev->stats.tx_dropped++;
>>>  	skb_tx_error(skb);
>>>  	kfree_skb(skb);
>>>  	rcu_read_unlock();
>>
>> This is no longer atomic. Multiple CPUs may try to update it at the
>> same time.
>>
>> Do you know what the story on dev->rx_dropped is? The kdoc says drivers
>> are not supposed to use it but:
>>
>> drivers/net/ipvlan/ipvlan_core.c:               atomic_long_inc(&skb->dev->rx_dropped);
>> drivers/net/macvlan.c:  atomic_long_inc(&skb->dev->rx_dropped);
>> drivers/net/vxlan.c:            atomic_long_inc(&vxlan->dev->rx_dropped);
>>
>> Maybe tun can use it, too?
>>
> Thanks, yes that should be possible. Here we speak about tx_dropped,
> but AFAICS the same applies as for rx_dropped. Will change it accordingly
> in a v3.
> 
For rx_dropped and tx_dropped it's easy, however tun also has a per-cpu
counter for rx_frame_errors that is incremented if virtio_net_hdr_to_skb()
fails. Not sure how to deal best with this one.
