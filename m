Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200C0C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Apr 2022 16:06:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 037eb0c3;
	Thu, 28 Apr 2022 16:06:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c539a5d2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Apr 2022 16:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651161995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymFvaz8a/ubJLwW4jTXXd97KopLtZOBPbdxPL02P7JY=;
 b=VjUhORwq9fjkPSsvlgV6pOGaTYywGEseVSUsbc08wWmR9YMYGQmemghc3SUyDRdtroxjcY
 rniz/b0ekQBCNmM56csaOp5Xs+Klh9uwGkiaPcKsUzIwxuexjJBdcyP1MLlnRb4QhkbObm
 7HkQrbxBHLItI+5JlOY0nSWia1wYgJk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-XpOftjRGOjmGeMEx9qlbYg-1; Thu, 28 Apr 2022 12:06:34 -0400
X-MC-Unique: XpOftjRGOjmGeMEx9qlbYg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso3505130qkb.11
 for <wireguard@lists.zx2c4.com>; Thu, 28 Apr 2022 09:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ymFvaz8a/ubJLwW4jTXXd97KopLtZOBPbdxPL02P7JY=;
 b=w72exxnGgshBs0cPq60k9EwC5L24qRZpIcvhV4zFaGzw5vsolZEfHcvLSKKa2FWERJ
 jfj7rSqTXs5GLkVsv5FuI1R3qx5B8TgPMjrJOS+xMTe7K3n/ZxLa87YT0kRkTKZ0sg0N
 RHACSSyuRDvUFuLf+L3wI5FOxShB3L/SL72SLj1rKh8Sg/g17lY5lH8vtixcuK0hMhN4
 1SIhAk1mh2rHkz/wjiGM86YnMTdlfcXu3MO3UxsKK5OuEgStTxcizGdsZ1qyZ+kLQdlt
 tTZRd//lAS5GpdIgL2YqKLQSmmHWFOgIg5cshaYJRnoiWRBE6+qTjymW1VJepaygYnah
 9mQg==
X-Gm-Message-State: AOAM531rCfSt8MkOSlJWiYa9+jpR618yur2GuNnIqxxAxaKidA0Hvtkf
 zauOJ0USklld6EHyxPZmKjX8nvHq9B8gCG84wOg9BZoXWjZJbQuhg4ejT0KYB32zTOzO/WfpKiA
 3wzhcm6VzryQBBGjx0JIG
X-Received: by 2002:a05:620a:bc6:b0:67d:1870:8b35 with SMTP id
 s6-20020a05620a0bc600b0067d18708b35mr19936214qki.85.1651161993290; 
 Thu, 28 Apr 2022 09:06:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn3WXda00cVzUDa2s3fuM3BrMD8BZZxPpOb8OpK7TtQKcAMg+Xbpw/blm796W+G9nxoIgHgA==
X-Received: by 2002:a05:620a:bc6:b0:67d:1870:8b35 with SMTP id
 s6-20020a05620a0bc600b0067d18708b35mr19936189qki.85.1651161992892; 
 Thu, 28 Apr 2022 09:06:32 -0700 (PDT)
Received: from [172.31.1.6] ([71.168.80.171]) by smtp.gmail.com with ESMTPSA id
 m16-20020a05622a055000b002f35423f7c0sm225092qtx.93.2022.04.28.09.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 09:06:32 -0700 (PDT)
Message-ID: <fde03ba9-d12a-e574-296f-747ad6141497@redhat.com>
Date: Thu, 28 Apr 2022 12:06:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: wireguard.ko on RHEL8
To: Joe Doss <joe@solidadmin.com>
Cc: wireguard@lists.zx2c4.com
References: <22218021-270c-8ac9-c214-76ae4e1c1263@redhat.com>
 <a18d6a8a-1dcc-3093-6931-5ffb1236d287@solidadmin.com>
From: Steve Dickson <steved@redhat.com>
In-Reply-To: <a18d6a8a-1dcc-3093-6931-5ffb1236d287@solidadmin.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=steved@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hey!

My apologies on my delayed response...

On 4/24/22 4:03 PM, Joe Doss wrote:
> Hey Steve,
> 
> On 4/24/22 1:16 PM, Steve Dickson wrote:
>>
>> Trying to install wireguard.ko on a RHEL8 vm (4.18.0-348.el8.x86_64)
>> and I'm getting
>>
>>     wireguard: module verification failed: signature and/or required 
>> key missing - tainting kernel
>>
>> The entire error:
>> http://pastebin.test.redhat.com/1046896
>>
>> is there anything at can be done about that?
>>
>> I'm new to wireguard and I'm pretty impress...
>> It came up in both Fedora rawhide and an
>> unreleased verson of RHEL9...
>>
>> We are trying to used it as our network in
>> a community wide virtual NFS testing event
>> called Bakeathon [1]
>>
>> Again I'm new to wireguard but not to kernels ;-)
>> So if you could throw something at me to
>> help me get over this bum... It would be appreciated!
>>
>> Note: I am not member of this list so please
>> reply to be directly.
> 
> You have secure boot enabled, so you need to generate a MOK key pair, 
> manually sign your wireguard.ko, and enroll your MOK cert or disable 
> secure boot.
> 
> I use this script [1] to sign my NVIDIA drivers on my workstation after 
> they are built via akmod.
> 
> Hope this helps!
> Joe
> 
> [1]: https://gist.github.com/jdoss/495e814ef4ef599e480c31d4843eb6c0
> 
Thanks for the pointer... but I ended doing something
different that worked very well...

1) I enabled the Fedora Infra Cloud repo which has
    the jdoss/wireguard repo
       dnf copr enable jdoss/wireguard

2) Then installed the  wireguard-dkms and  wireguard-tools
    packets which brought in the dkms command.
        dnf install wireguard-dkms wireguard-tools

3) Then I simply reboot and mdks compile the module and
    installed it... Very cool!

Thanks again!

steved.

