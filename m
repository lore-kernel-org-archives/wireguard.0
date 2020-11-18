Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCFAC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 09:30:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F6420857
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 09:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=sidn.nl header.i=@sidn.nl header.b="L1N+E8wf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F6420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=sidn.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ccd40b3;
	Wed, 18 Nov 2020 09:24:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9068eb48
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 09:24:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0HrbXshV6LfVffdicxAGGYiyk58KVI1vjWQuCndkpa3YJNClrmc5GhAFS+bYbt4tZb5cRAHVLpo7Y40qK7DVwsRHfnXSsK/FsY3rbRhY+pCiE/lO2pHp4WYFKRBZWq/AHiot70pCFvJ5eXEIrCGtvj2uem1WVGX7rN2xdZOJsPFxbYnKYIDP0PxxaTVhP7ZvmSxJ8qGTpaEwCCX4Iu83zBgROrkRL3QAx0o2yVpGwoH29ErMOBgKsOeXeZHjUBS26aRZ2GBOGmHfufWxB7nI76rCzfJ2FRvOIoASoFcZ4mbDihHoz+rWfPFdUfaO7KgOUTJxm2/DYVpeQsPavHbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB4GqkJOxplFfuSGnJ1XLaFdKuteBsmPsgVKw0FGtmQ=;
 b=ibpvTz4S5D+VlRWyQwQeG6Yx0Qb/3myxZuBVrdXhjv2mE7DuWibJCMXf2/DoJyWYWt7QTQS2k2tg9inMdHA9FJOzCzjnnf6KZB2/1Vswh8YVskKwssWDwlPhl6XLInjCy7zZve4ZiFCI6egH7/AiWBypW7q1emX9NHrs0dRY5UEjFSnDx17ku7ZkPFmiGrczEf4QB8Yxp/L7vI++deNkKbVlHr+h6oIc5+0DWDweXLU9uxWe2oFK0e8fseVV9/L7iV/9z4/buYNFp74AktFw2Jx934ZqWRTeR8qPFbq8yUL7Tn9NbdviBPIDkM9djMzgPyDm3GGcUhnU9YsLoidNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sidn.nl; dmarc=pass action=none header.from=sidn.nl; dkim=pass
 header.d=sidn.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sidn.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB4GqkJOxplFfuSGnJ1XLaFdKuteBsmPsgVKw0FGtmQ=;
 b=L1N+E8wf+rVJLFgJ6xjiFQbNw7ylGLraEOmcGu0ncKV+0ujnP7XAz7beoJd4YOhTtYfsOzLfvXHodUZwXdgc2O+Ryjd4AkZETmUtltCKiNfbbuxBbeMnuZPIM3Mj+DMANzFgym7lDKOEjlonpZRag4rGYuUh6BmAObOcml2JAzg=
Authentication-Results: romanrm.net; dkim=none (message not signed)
 header.d=none;romanrm.net; dmarc=none action=none header.from=sidn.nl;
Received: from AM0P194MB0483.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:162::18)
 by AM0P194MB0515.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:16b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 09:29:30 +0000
Received: from AM0P194MB0483.EURP194.PROD.OUTLOOK.COM
 ([fe80::2596:bd53:9c61:4d93]) by AM0P194MB0483.EURP194.PROD.OUTLOOK.COM
 ([fe80::2596:bd53:9c61:4d93%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 09:29:30 +0000
To: wireguard@lists.zx2c4.com
Cc: Roman Mamedov <rm@romanrm.net>
References: <92cb652f-b818-7224-f004-c324af5e7956@sidn.nl>
 <20201118123213.227694ac@natsu>
From: "Marco Davids (SIDN)" <marco.davids@sidn.nl>
Organization: =?UTF-8?B?U0lETiDwn4ez8J+HsSAodmlhIG15IPCfkrsp?=
Subject: Re: OSX and Happy Eyeballs
Message-ID: <7cc44d51-881c-a57f-dc2a-8850296c0928@sidn.nl>
Date: Wed, 18 Nov 2020 10:29:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
In-Reply-To: <20201118123213.227694ac@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [94.198.159.178]
X-ClientProxiedBy: AM9P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::30) To AM0P194MB0483.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:162::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from MacBook-Pro-MD.local (94.198.159.178) by
 AM9P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 09:29:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53014637-a0a8-4c29-86cf-08d88ba473c8
X-MS-TrafficTypeDiagnostic: AM0P194MB0515:
X-Microsoft-Antispam-PRVS: <AM0P194MB0515FF4DA3995565B13D0B3597E10@AM0P194MB0515.EURP194.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QmqQilPeghA1Jou2sDHokyyzPnFLTiEKew5LjHH0pyb0xVFunOo16hAylVMK1Q5TBU1gf02ZXVt1uvlKsCdzryggHypvl+Dt0m5Y1RMBY5fxAXNr2NJd9kuJpIdmLyNJLqBzdSf83MV5+sBLq8l4dFz/ita7++pvzRrSgph/z/JVqbcRXhifVLj2JSL/a/KSU3HQAOf13ecasbzpvwMw+to6csLP7b+XLhsCxn0/NNvHxKdpSxoZowhseKSrA8UP2NLx/1ty3wG9wSYOp0cmTh5TMRziPTnhRgqkNaaRBfy1Oi4AduqR+0IqEbji+fTUxuIBE7HFY47xDaByWAmyGYNh+pRk+MUQUZTwn/zrq4u738T5MuDS58nsrwd3JBJr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0P194MB0483.EURP194.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39850400004)(396003)(136003)(316002)(66476007)(8936002)(2616005)(86362001)(2906002)(3480700007)(66946007)(31686004)(66556008)(6486002)(4326008)(31696002)(186003)(4744005)(36756003)(16526019)(6916009)(36916002)(26005)(956004)(478600001)(6512007)(52116002)(8676002)(5660300002)(6506007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CIwgTUTPerymVooTMfF3k7SBW2iXD4YmwxTN3dZppK91KdFa8QCHpWkDw2Az5eyrhSCvNPml5NVMG8XSfj/BB1O3Q7Svfu8+ez3EvhCKrfNka+bHuGVY9w5tnefhg5FvNNpJVZizYOCzZ8En//fe5cMrJemx5OmIKrq7ypZAaTV2N4s/CFS0jvgNgKkUQxlSt417o+OyoEXKpgyYIivSncEoH3uZpoZNAjH/dsM3Nrx/C/ijuqVB09bO1B5sx6T+6VnqvVFRyoS6nTsoq2oO36ZC6DqkCjd3zH8TBbyHZPqudSoSSOOHiUPbIV4kMY//KJ/I78Vaxwd+l+BXaOtdW3LkrZYkVYkMEyHYZGR61jkdxZi295dmSF8+FcFL7JJTR2EwbbwGB8xVbWQubSgqPK7f6lS8YB9hUV9ci9qjtDG2KXazICuIlkf+8X/aA6yBmV63Y7lAdoy+L15fnlOW/HqbCmq2lLhyXxn/SoIrPy0oUakHoqRJUyBsfgLjOlCysguLkBaaUJyM2HxxhS0mlGRHn83eb8Y1tiWqPWQUvsZrg7pX7tdOf7hL7fXgQz7MCHa7ZolLhkiqI9443s9JZIg72m+Ej0n/qpdbmj73Ds+PYdcnw30Za+/0ZWwCGoQEgrAu6YmPzBOXM0VUGoaMxSP7512zjf4wtmJW02A5SOKbNxRoUsiRSowHklNQwNmgzabDy3e39bdFLWh1N7WSBW3TlOwHO1yzUD6PWtBuxHuMqsgY7Nf3pUhjKUrmv4zT3DfljG7RilbkCPrhkN18ivH+Wv1E7pJ3KVVplrzDRma82k3thI70HAUvLTK23q8yLgoudH9Pc0WV2EotWQvlpIFYPQmkd6dQrn+aZ2zgW3l78rRpOCVe5KjGMICx66eDghwMig370brS3CkkNrqsBw==
X-OriginatorOrg: sidn.nl
X-MS-Exchange-CrossTenant-Network-Message-Id: 53014637-a0a8-4c29-86cf-08d88ba473c8
X-MS-Exchange-CrossTenant-AuthSource: AM0P194MB0483.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 09:29:30.8016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ab4d3626-c1c5-4a75-ab85-427f1a644a7d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ps8KrQybTsXYX9ORC/305vXGdLYWrweXNlNjqFApjM5CSAT4DZWmwi4Gr/jFXK3f/61weBu+4x7F1C4kKVvYPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P194MB0515
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

Hi Roman,

Op 18-11-2020 om 08:32 schreef Roman Mamedov:

> Do you use ULA IPs (fc00::/7) for the tunnel endpoints? Those are always
> depreferred compared to IPv4. See RFC 6724:

Actually we do this:

10.42.42.0/24
fddd:42:42:42/64

Let us test with some other prefix. Thanks for the hint.

I'll get back with results, once we have them.

-- 
Marco

