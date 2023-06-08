Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69417C7EE29
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jun 2023 11:45:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c67dd695;
	Thu, 8 Jun 2023 11:45:33 +0000 (UTC)
Received: from sonic310-57.consmr.mail.ir2.yahoo.com
 (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f3b01ce
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Jun 2023 11:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1686224730; bh=IM3chJSV84cF0F6Nmi+YRm25zuQ/ZCGgacij/wrq/2A=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=rdrp/qfOp67/581saMr0KwHlQOrmOhJlPkAHYvkyvDcDUJukUsDxhxBhHzUTtLR3w6blIn+x+jiE+of5MFRVO6dnqng2wfzrZlyrgnoJcfp3piDwAYb02pj0uf6vd4MWlAwGYnqbA240GpXeqXrx2ZjPuefU24phdgZJ7dOvKUONWmJFKj3UirtJlIDkTdAXlhn1yc2etkrPIiishlVUVBcemJEyMaCRDhzSjDP58lAtuQ9RXhElmPkNoED9BhuAKmHgWPIia87PEJlbwjr5Cs05gEYUdLY/oREoFja8ZJd46Gqu0l836XItrZTCgGmZuZ6hYRLCZdGoNZ6ax642EA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1686224730; bh=jr5uEbS+CEmo/xLUP/qGB///nPOIXv8hQoL9JuogAsF=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=KJ7MTxADvUWzKXWEWWHOMIbtE4SntQE1kcINyH7wcqkngQFoKODL+DovDxhXoVxDYyIumoXHYGxk2O5WPfIcWPmRUT+W/LLAQoQiMb+eB2NwvYeRUIIdTpvSPocuqJXisM337Gli5wr+Q/bSLYEtHpgcESNjwrjAd8JyLau2oQcZu0t/69CsOazLt7uDKE3UKGENI0JF9QG7CTsJlGOkrmp0hAB2L3ERTEpMVMg+Qe5uylzc8bbN168g9gdTPwcwgE/ZBcsFoCo4t3xLwceQq5Q+Zj0/mD4zHecYlnSW8N41L97k+AU0qBXHVBAtr9egVOcEByTM6kCJRJj37KlGpA==
X-YMail-OSG: VBhLucoVM1n2WQVp8qr6fZG5WYkVGbcaahwH_mjenlz9FIrzWUzglv6wSxKBgZx
 3ppN3Abv9yD2wUUgF08QAfRNajoNKmks5As3L9j_dyARQPyuXnjUmR71Rr8opJICqEYY2Dq.8x.1
 Uakr4Y.jQHpXl5cDCOpU_GjR9DRz8fXJYGd4nT2yBhSktaD.s0ax7VrdAf1q5nxMU5FN91jTLloi
 3xdievbLWXJLeJ3n.MP6eKRyx2CfLxivX9O9hL97qF3ZkXA87pyAFfXZY3Ae.xLr7ekWXCmY4Ped
 0hYpYo12MqaexUyObPQaKwICLvqTR1EXecLNxl6YQbgp_B2MlBlz7.xvMm6CfnPDEn7vnH2reruQ
 tiZttNCkVnqFw8Ti0s1D949fDcvzqGsOudxbrBI7WU7U1R.9KtCYY_SKg8TB1FgBLyCaXrqyB3bR
 6F3CSLNBeTbURiDCjB8f2bt.EKtkyY6MOSAN2UbVPsAxrRnR_qf.DYSTlkGu5GaPKcA17X7nekEo
 Z3wlaM2ZnsTr49uQLLP6BTCwnQ4VWj9LlnshfQo6LgYvTohP7mnpjKki4ONMIVb7xYEcAA.RuL7x
 1GvNeBKFAeQDmwqa8_fSWDNY3uH3IANUshmJ6uob3NwmfP3s4qnr0x0Hputv6gUsAcX4yCbzQNdI
 aGDsnYds7V2t7M5VMXHVRS_eFjIT7MQ8EaoisDLaMPtb9qNLBAmtKf4erMe0mPYYMYVicV6c7ZMr
 DaLlcmhvB61Y.ecnyyl0cb0DLSGpyT6WEtoQKI4tSdRNOT7hc7qtr0wuL89eFUyW02KffodjOPSn
 dvfuJwLSx_rvYgLo5HdBLek.alF3aZ0ZAggtUTp8QI5045askTXNoc8GbMyqGu5_Z15Oc647LBjR
 RFmT5FgY9rO9pMA91PUqIllHN8bBZqHqbh7_P3aLkMsU79LmtkpjqSD_.BbSI9Eq3IWxsdpZWCkw
 QQNDnefc65JkGevOwrIl7nLFbM_v0bK35bOfpsYWyZ1yf6zMbqI045oFSCWB_vn1n22_CenjuXlQ
 1CevDXjxmHw3t_vDHggLD_lziSQQq6TZIBVphaJC6tm3FMgV3nUXQIdH8nUq5UnhhE_3JrzPzxCG
 cfNZTW6nXYfVrs7X2XLnPB1XZ0jUuWpJ20ZoiO8EvZ.vo0D2ksVPxozTZZGoFMCTvOmf_s0TkFIc
 cn.vJ7IRvjFzfgC0Wtt2uTkSJ0UAMIlEztxc4JjPZ14JmAJ96m71sXgRADRxZ0wyHbvYq4nnljTm
 aH3cbMKSNx9.Vy.y5Edo0E6UuaNKbF7CCJRuaFFumuBvkUToAnDPn9SmDkNMbPoTIXlMK5sQVaCj
 bCghZ2Bp4gyddn5CxW9wQd4zMtGMXiKL4oDmVwYz2bP8DRBZtetgDJJeWEYB20Y.sz2NHXoYq2OF
 Hl.DgCxOnGBcIa3lZ24Siwwgdr0SFeWIGlftoAX.huSolk9wE4niQdtguiu3sF6NUXstzx09QJYy
 ijtLgRYAW0NPb14VsBN8NHJxyF9fVOfgsut9RM6ugGsvkzQV8A3eadM12M85ViUGqqvz7E65OFGN
 qC1Rr2UAJjlnNlRtcfDnPTlwGjiS8Ef8Dt2cFHoJWUQdyg6Rtr.WCptsSoS374MyGHK5uflVU9Sl
 DkJaPuy9HMVOmLC.vbbDHaINAXGXz_KJp_oerLsVuPRZXfgidV2kwuqHfe8hey_OhfXkjF8kQCa9
 xtjimZzVOK9eBGl4wqxpjdA364OeOg0E.MHdgCCKpub1QmC0EyPGKcxs7beIAjjHVycLywJLl8ug
 klqgzw5JYeO3ow8_DKxLC2YVg5YOJhYRqjCxtjM1UcHD2S3e4hHyp8OiUnhGu3Vwe13S8nxKZgXL
 YRT99SMjz8vpUgCBbRES_ZAC7l60AwxFGsL_ZhclgLF0ukS2.DqDxKkMDsU_s.yboeJExirTrkIp
 K1uvkvMlVhNgPa78NMijuyXvvr7Tvv4tLSXObEoofSey8yo8vLANA03JUabYA66l7ggSdMDzyxak
 .IQJ12rzyLgFS7gNzAnKH7PeuzrknGlBzam.WjTpaYyl7mTJe6nkud1vy6KfgHfx6xiBoHazKm8H
 Plj2V032RqEUaOiSDgZxYl4w4.8wiMHgut1CTd3fY2zIJlwndtVqS0Q9UdKOLL.3FXaj7pU7bWxW
 rddD4JRsFwTktat.0k5_y7c0xXqmSOMDvNa90I8WxkfVeTqykva7MnYGKb7Z24IdvrObOQs2B0as
 1ymVF9vI5nyUF.0NyQM6L7dV43DRopqvIScmVqdu2KA2y2g.fzZnZ2gzMEKWB7zHTAzTR9zG5HDN
 RPynfJxs-
X-Sonic-MF: <peljasz@yahoo.co.uk>
X-Sonic-ID: 7f5c5452-34f4-402f-96e9-762c902ca529
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ir2.yahoo.com with HTTP; Thu, 8 Jun 2023 11:45:30 +0000
Received: by hermes--production-ir2-7867f454fc-tvpbc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 050d899b5215d4e990b5442b8f694e8d; 
 Thu, 08 Jun 2023 11:45:28 +0000 (UTC)
Message-ID: <8792819b-a595-7789-fc6f-3bce89d13d28@yahoo.co.uk>
Date: Thu, 8 Jun 2023 13:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: How to post to the mailling list? (Was: IP which is not there but
 wg0 replies - ?)
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <980aa33e-4bb4-e746-b45a-c0ab0ea7e371.ref@yahoo.co.uk>
 <980aa33e-4bb4-e746-b45a-c0ab0ea7e371@yahoo.co.uk>
 <20230608114742.63648767@parrot>
From: lejeczek <peljasz@yahoo.co.uk>
In-Reply-To: <20230608114742.63648767@parrot>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21516
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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



On 08/06/2023 11:47, Marek Küthe wrote:
> Hello,
>
> I would be interested to know how you managed to post something on the
> Mailling list? I have been trying to do this for several weeks, however
> my messages do not arrive. Do you have a special trick?
>
> I would appreciate an answer!
>
> Greetings
> Marek Küthe
>
> On Thu, 8 Jun 2023 11:30:26 +0200
> lejeczek <peljasz@yahoo.co.uk> wrote:
>
>> Hi guys.
>>
>> Purely accidentally I stumbled uppon:
>>
>> -> $ ping 10.1.101
>> PING 10.1.101 (10.1.0.101) 56(84) bytes of data.
>> 64 bytes from 10.1.0.101: icmp_seq=1 ttl=64 time=0.148 ms
>> 64 bytes from 10.1.0.101: icmp_seq=2 ttl=64 time=0.415 ms
>>
>> -> $ ip a ls dev wg0
>> 17: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 8920 qdisc
>> noqueue state UNKNOWN group default qlen 1000
>>       link/none
>>       inet 10.1.0.99/24 scope global wg0
>>          valid_lft forever preferred_lft forever
>> peer:
>> 14: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 8920 qdisc
>> noqueue state UNKNOWN group default qlen 1000
>>       link/none
>>       inet 10.1.0.100/24 scope global wg0
>>          valid_lft forever preferred_lft forever
>>
>> This a wg0's IP.
>> Someone could shed a bit more light on that - I'd imagine
>> many will appreciate, I will.
>> I'm thinking - is my ipcalcing messed up..
>> many thanks, L.
>>
>
Apparently the list (maintainers?) practice old & healthy 
habit - which placing replies below/at bottom also is -  to 
accept only "text" format for a message. (I presume for new 
message/thread)
Test that if you will. (Thunderbird works)
regards, L.
