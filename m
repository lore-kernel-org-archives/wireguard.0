Return-Path: <SRS0=pGg3=E7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2102C56202
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 16:21:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0FC2067C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Nov 2020 16:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="1vN0IIWU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0FC2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b3c41b3;
	Wed, 25 Nov 2020 16:16:07 +0000 (UTC)
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com
 [205.220.184.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62c3b7bc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Nov 2020 16:16:03 +0000 (UTC)
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
 by mx07-0057a101.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APGG41S016030; Wed, 25 Nov 2020 17:21:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com;
 h=to : cc :
 references : from : subject : message-id : date : mime-version :
 in-reply-to : content-type : content-transfer-encoding; s=12052020;
 bh=6nYq74njgpeT3A88MKSB2wst9LnAaukjU54sc8Vdo5A=;
 b=1vN0IIWUnPRvOvpqe/OumWKhjtOSXmJTMFDuUMizi1WRtLLPzKQ5RnZPBQim+zEgP2oo
 O//YpiJgUaMoOaXIkqnS4vamgU/d/7EAfF04BZT3cI9TQD0zZOgoG92Eu4DvziugJkns
 CJa6MEbAuwfs1uKTO9SmjqLHpC6lzXk+ltbY31OZT/4oyB6/OfOqZ8xaiS6nJkCFSBRw
 GKZaJ0YHieZTsowFyIRM9b/ZuL/EbvnWfAJqSaupk1yH9K3rK+E3/Yhv6u/eGTCzRGH9
 9lt3Y16Zj0bIHAp75ypLNXetaQdzngXIutGcSsAnWvWwuoG2coVJ+QLHgJwQSdPk4Vzw 0g== 
Received: from mail.beijerelectronics.com ([195.67.87.131])
 by mx07-0057a101.pphosted.com with ESMTP id 34y04xkwvj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 17:21:42 +0100
Received: from wsests-s0004.westermo.com (192.168.10.12) by
 EX01GLOBAL.beijerelectronics.com (10.101.10.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1847.3; Wed, 25 Nov 2020 17:20:52 +0100
Received: from [10.0.11.179] (172.29.100.2) by wsests-s0004.westermo.com
 (192.168.10.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1847.3; Wed, 25
 Nov 2020 17:20:51 +0100
To: =?UTF-8?Q?Ivan_Lab=c3=a1th?= <labawi-wg@matrix-dream.net>
CC: <wireguard@lists.zx2c4.com>
References: <d8f3a1a9-1f5e-ce1e-06c7-5aab45396d97@westermo.com>
 <20201124075737.GA18512@matrix-dream.net>
From: Matthias May <matthias.may@westermo.com>
Subject: Re: "roaming" between source ports does not work
Message-ID: <44a24a88-ed50-bf82-0ff4-f6a3823cc15d@westermo.com>
Date: Wed, 25 Nov 2020 17:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124075737.GA18512@matrix-dream.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.29.100.2]
X-ClientProxiedBy: wsevst-s0023.westermo.com (192.168.130.120) To
 wsests-s0004.westermo.com (192.168.10.12)
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

On 24/11/2020 08:57, Ivan Labáth wrote:
> Hello,
> 
> are you sure changing of source port is the issue?
> Seems like something that would be reported a long
> time ago.
> 
> Wireguard handshake fails, if your timestamps aren't
> monotonically increasing - maybe this is the issue?
> 
> For confirmation - does connection fail on wg restart without
> a device power cycle, or if you change the source port
> while the tunnel is running?
> 
> If your device is power cycling on a schedule, without a RTC,
> you should arrange an increasing nonce/time, if you can save
> data, maybe use NTP or a workaround may be to remove and
> re-add the peer on the server on a compatible schedule, 
> 
> Regards,
> Ivan
> 
> 
> On Sun, Nov 08, 2020 at 11:00:30PM +0100, Matthias May wrote:
>> Hi
>>
>> == Premise
>> * I've recently implemented support for wireguard in our LTE-router.
>>
>> == Source Environment
>> * The basis is OpenWRT.
>> * Used versions:
>> * On the client/initiator:
>>  * wg
>>   * 1.0.20200908
>>   * ad33b2d2267a37e0f65c97e65e7d4d926d5aef7d530c251b63fbf919048eead9
>>  * wg-tools
>>   * 1.0.20200827
>>   * 51bc85e33a5b3cf353786ae64b0f1216d7a871447f058b6137f793eb0f53b7fd
>> * On the server/responder:
>>  * Debian stretch (9.13), installed from repository
>>  * deb https://urldefense.com/v3/__http://deb.debian.org/debian/__;!!I9LPvj3b!RT42f9KbvkRAUCotWoe9WbvdGg0pfsEckxDFl3iujPxZcNW5KHCoRkhTfxHA91cvFlQ$  unstable main
>>  * # wg --version
>>  * wireguard-tools v1.0.20200827
>>  * I don't really know what the version of the build dkms is
>>
>> == Issue
>> * We've implemented an automated test that seems to have a problem.
>>  * Each night, the device is configured to connect to the debian box.
>>   * This works fine the first time.
>>   * However it doesn't work anymore after this first time.
>>
>> == Observerion
>> When the "client" connects the first time, wg-output on the "server"
>> looks like this:
>>> interface: wg1
>>>   public key: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=
>>>   private key: (hidden)
>>>   listening port: 51821
>>>
>>> peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>>>   endpoint: 172.29.42.230:38442
>>>   allowed ips: 10.0.41.3/32
>>>   latest handshake: 44 seconds ago
>>>   transfer: 8.01 MiB received, 7.96 MiB sent
>>
>> and on the "client:
>>> interface: wg1
>>>   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>>>   private key: (hidden)
>>>   listening port: 38442
>>>
>>> peer: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=
>>>   endpoint: 172.29.60.13:51821
>>>   allowed ips: 10.0.41.0/24
>>>   latest handshake: 1 minute, 3 seconds ago
>>>   transfer: 187.06 KiB received, 189.96 KiB sent
>>
>> Ports and IPs match, everything works.
>>
>> However on the second run of the test:
>> On the "server" still:
>>> peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>>>   endpoint: 172.29.42.230:38442
>>>   allowed ips: 10.0.41.3/32
>>>   latest handshake: 4 minutes, 52 seconds ago
>>>   transfer: 8.05 MiB received, 7.99 MiB sent
>>
>> But the "client" shows:
>>> interface: wg1
>>>   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>>>   private key: (hidden)
>>>   listening port: 47858
>>
>> The client device has been restarted in between.
>>
>> Since the listen-port is set to 0, it obviously has now a new,
>> different, source-port.
>> The server doesn't pick this up.
>> Since peers may roam between IPs, i was under the impression, that it
>> would also roam between ports.
>>
>>
>> Is this working as intended?
>> If yes: How should the configuration look like to support clients doing
>> a power-cycle?
>>
>>
>> I'm aware, that i could set a static port on the client, but this won't
>> work when going through NAT with port-scrambling.
>> So i don't really have control over the source-port of the connection
>> anyway.
>> I suppose this would also apply when a router/firewall inbetween has
>> some aggressive killing of states where the keepalive is not fast
>> enough, and source-port scrambling is done.
>>
>> But the main usecase i'm looking at here is: restart of a device.
>>
>> BR
>> Matthias


Hi Ivan
Thank you for response.
It seems my message was hanging somewhere, at least i didn't see it show up on the list until just now, thus i gave up
on it.

Yes your suggestion to use NTP is/was correct.
I found some similar reports.
Once NTP was configured, roaming between ports started working.

BR
Matthias
