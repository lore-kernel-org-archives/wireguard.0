Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D1EC5517A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:01:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486D12074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 23:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLQY3sFy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486D12074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 155de583;
	Mon, 9 Nov 2020 22:40:33 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5a21bce0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Nov 2020 07:45:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h62so421910wme.3
 for <wireguard@lists.zx2c4.com>; Thu, 05 Nov 2020 23:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WH3QuXQlKWhEUj+bRBQ/dSMtZW/vy09YGu3j1KAb8H0=;
 b=kLQY3sFya+HBpxhe0gsHfL5sBjNFKlxX2HGeCw8FO6pMddNkbyktGUsVuqLJr/btGR
 buJc7MNcBXMxqkOC/wZnhXSAouoSv4w/mG/sU/1d42KMzwihxal65tPBDM5ST+zj9FgG
 N5up7KyBDm1jTgro3/qBmKUNs5trHC/snirkILQAaP5IAzqx0Ssqs9JaAtTf3C+ydACz
 fekCtGUKxoUKGqI7hKbLgvsGMxzujDp5gusWzhV7VD3Tf1bpxYLGBMhy9g1kNltOwYq7
 ASUdmztnRnK1MY+MD8QYi3AxOwo8ToAKB7QQ56oK6DwM+oH9Njg1srf7N0PPraxQgY1M
 7lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WH3QuXQlKWhEUj+bRBQ/dSMtZW/vy09YGu3j1KAb8H0=;
 b=LWywdVw19Rp6OnkaFMYQvfIH94fzPCg1Zb1qMnUA5QkymKj0yUAPbmZyIFjduU3pWB
 zf8Ep08gzJsKUeVcAVFGK9Jj0fpRPNBBxl8Z2DqO/dGVyBMRckZ9YMtlsWIDuRGVbAW3
 9BUk0tMnI2CDcuUKNQvzRdHjkcEYeWDYKA1FRaIIFAC4nTM7CEvN89CfZ2rC7UM/k8+a
 En5vSjQ+42nQn19gmTEugwZnWPBMfsJwmyQta0eQfw1t/kVYDC6yVaeocboL7bPaszm0
 iUp5T93LqPCBDhQydJQFsMfIA+3j8v7bFLW2qu5pZX5JRNYYgQe8QlQCPdntG2x5cIs4
 FFfA==
X-Gm-Message-State: AOAM53085kR42hXeDNMcwtbLB82wDBO8p2PpcOI1tul7IkwtzJWhm6qf
 cTbUpscA3oGR8/nrjzjuKHM=
X-Google-Smtp-Source: ABdhPJx6q/68xSPg7yNNuimz3lvIELcLSvTiiBQ2W/8hZWSBUHN+fOnaVRJxEYQUrCk0aCiPJOSwBg==
X-Received: by 2002:a1c:7dc8:: with SMTP id y191mr1004454wmc.118.1604648934466; 
 Thu, 05 Nov 2020 23:48:54 -0800 (PST)
Received: from ?IPv6:2003:ea:8f23:2800:8d7e:efd:393d:7a36?
 (p200300ea8f2328008d7e0efd393d7a36.dip0.t-ipconnect.de.
 [2003:ea:8f23:2800:8d7e:efd:393d:7a36])
 by smtp.googlemail.com with ESMTPSA id v12sm752195wro.72.2020.11.05.23.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 23:48:53 -0800 (PST)
Subject: Re: [PATCH net-next v2 03/10] tun: switch to net core provided
 statistics counters
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <dcb51de1-5e11-7c07-9784-bf3546a1246a@gmail.com>
Date: Fri, 6 Nov 2020 08:48:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105171446.5f78f1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
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

On 06.11.2020 02:14, Jakub Kicinski wrote:
> On Wed, 4 Nov 2020 15:25:24 +0100 Heiner Kallweit wrote:
>> @@ -1066,7 +1054,7 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
>>  	return NETDEV_TX_OK;
>>  
>>  drop:
>> -	this_cpu_inc(tun->pcpu_stats->tx_dropped);
>> +	dev->stats.tx_dropped++;
>>  	skb_tx_error(skb);
>>  	kfree_skb(skb);
>>  	rcu_read_unlock();
> 
> This is no longer atomic. Multiple CPUs may try to update it at the
> same time.
> 
> Do you know what the story on dev->rx_dropped is? The kdoc says drivers
> are not supposed to use it but:
> 
> drivers/net/ipvlan/ipvlan_core.c:               atomic_long_inc(&skb->dev->rx_dropped);
> drivers/net/macvlan.c:  atomic_long_inc(&skb->dev->rx_dropped);
> drivers/net/vxlan.c:            atomic_long_inc(&vxlan->dev->rx_dropped);
> 
> Maybe tun can use it, too?
> 
Thanks, yes that should be possible. Here we speak about tx_dropped,
but AFAICS the same applies as for rx_dropped. Will change it accordingly
in a v3.
